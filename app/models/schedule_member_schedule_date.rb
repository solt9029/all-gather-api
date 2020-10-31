class ScheduleMemberScheduleDate < ApplicationRecord
  belongs_to :schedule_date
  belongs_to :schedule_member
end
