class Api::V1::SleepDurationListSerializer < BaseSerializer
  entity Api::V1::SleepDurationListEntity

  protected

  def association_array
    [
      :user
    ]
  end
end