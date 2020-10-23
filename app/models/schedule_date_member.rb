class ScheduleDateMember < ApplicationRecord
  belongs_to :schedule_date
  belongs_to :member
end
