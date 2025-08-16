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
    raise ServiceError.new(:user_is_sleeping) if @user.sleeping? && @action_type == 'sleep'
    raise ServiceError.new(:user_is_awake) if @user.awake? && @action_type == 'wake'
  end

  def clock_in
    clock_in_record = ClockIn.create_from_request(@user.id, @action_type)
    clock_in_time = clock_in_record.created_at
    sleeping_duration = SleepDuration.setup_for(@user)

    case @action_type
    when 'sleep'
      sleeping_duration.update(start_time: clock_in_time)
    when 'wake'
      sleeping_duration.update(end_time: clock_in_time)
    end
  end

  def create_result
    @result = @user.clock_ins.order(created_at: :desc)
  end
end
