class ScheduleMember < ApplicationRecord
  belongs_to :schedule
  has_many :schedule_member_schedule_dates
  has_many :schedule_dates, through: :schedule_member_schedule_dates
end
