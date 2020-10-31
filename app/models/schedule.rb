class Schedule < ApplicationRecord
  validates :title, presence: true
  has_many :schedule_dates
  has_many :members
end
