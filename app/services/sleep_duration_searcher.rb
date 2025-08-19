class SleepDurationSearcher < ServiceCaller

  def initialize(user, search_params, pagination_params)
    @user = user
    @search_params = search_params
    @page = pagination_params[:page] || 1
    @per_page = pagination_params[:per_page] || SleepDuration::PER_PAGE
  end

  def call
    setup_target_users
    search_by_conditions
    @result = @sleep_durations
  end

  private

  def setup_target_users
    case @search_params[:target]
    when 'following'
      @target_users = @user.following
    when 'self'
      @target_users = @user
    else
      @target_users = @user
    end
  end

  def search_by_conditions
    @sleep_durations = SleepDuration.awake.where(user: @target_users)

    date_range = format_time_range
    @sleep_durations = @sleep_durations.where(start_time: date_range)

    @sleep_durations = @sleep_durations.includes(:user).order(duration: :desc).page(@page).per(@per_page)
  end

  def format_time_range
    start_from = @search_params[:start_from].present? ? Time.parse(@search_params[:start_from]) : 1.week.ago
    end_at = @search_params[:end_at].present? ? Time.parse(@search_params[:end_at]) : Time.current
    start_from.beginning_of_day..end_at.end_of_day
  end

end
