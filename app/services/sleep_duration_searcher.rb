class SleepDurationSearcher < ServiceCaller

  def initialize(user, search_params, pagination_params)
    @user = user
    @search_params = search_params
    @target = search_params[:target] || 'following'
    @page = pagination_params[:page] || 1
    @per_page = pagination_params[:per_page] || SleepDuration::PER_PAGE
  end

  def call
    search_by_conditions
  end

  private

  def search_by_conditions
    search_by_date_range
    search_by_target

    @result = @sleep_durations
      .includes(:user)
      .order(duration: :desc)
      .page(@page)
      .per(@per_page)
  end

  def search_by_date_range
    date_range = format_time_range
    @sleep_durations = SleepDuration.awake
      .where(start_time: date_range)
  end

  def search_by_target
    case @target
    when 'following'
      @sleep_durations = @sleep_durations
        .joins("INNER JOIN follows ON follows.following_id = sleep_durations.user_id")
        .where(follows: { follower_id: @user.id })
    when 'self'
      @sleep_durations = @sleep_durations
        .where(user_id: @user.id)
    end
  end

  def format_time_range
    start_from = @search_params[:start_from].present? ? Time.parse(@search_params[:start_from]) : 1.week.ago
    end_at = @search_params[:end_at].present? ? Time.parse(@search_params[:end_at]) : Time.current
    start_from.beginning_of_day..end_at.end_of_day
  end

end
