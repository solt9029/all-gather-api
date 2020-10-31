class ScheduleDate < ApplicationRecord
  belongs_to :schedule
  has_many :schedule_member_schedule_dates
  has_many :schedule_members, through: :schedule_member_schedule_dates
end
