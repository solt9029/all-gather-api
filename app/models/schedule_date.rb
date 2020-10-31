class ScheduleDate < ApplicationRecord
  belongs_to :schedule
  has_many :schedule_member_schedule_dates
end
