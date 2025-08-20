class ClockIns::Creator < ServiceCaller
  def initialize(user, action_type)
    @user = user
    @action_type = action_type
  end

  def call
    check_action
    clock_in
    create_result
  end

  private

  def check_action
    @existing_sleep_duration = SleepDuration.find_by(user_id: @user.id, end_time: nil)
    raise ServiceError.new(:user_is_sleeping) if @existing_sleep_duration.present? && @action_type == 'sleep'
    raise ServiceError.new(:user_is_awake) if @existing_sleep_duration.nil? && @action_type == 'wake'
  end

  def clock_in
    ActiveRecord::Base.transaction do
      clock_in_record = ClockIn.create!(user_id: @user.id, action_type: @action_type)
      clock_in_time = clock_in_record.created_at
      sleeping_duration = @existing_sleep_duration || SleepDuration.new(user_id: @user.id)

      case @action_type
      when 'sleep'
        sleeping_duration.start_time = clock_in_time
      when 'wake'
        sleeping_duration.end_time = clock_in_time
      end

      sleeping_duration.save!
    end
  end

  def create_result
    @result = @user.clock_ins.order(created_at: :desc)
  end
end
