class ScheduleDate < ApplicationRecord
  belongs_to :schedule
  has_many :schedule_date_members
end
