class Api::V1::SleepDurationListEntity < ListEntity
  expose :sleep_duration_entities, as: :sleep_durations

  private

  def sleep_duration_entities
    @sleep_duration_entities ||= Api::V1::SleepDurationEntity.represent(pagination_items, options)
  end
end
