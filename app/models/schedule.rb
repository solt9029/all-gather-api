class Schedule < ApplicationRecord
  has_many :schedule_dates
  has_many :schedule_members

  validates :title, presence: true
  before_validation -> { self.title = 'タイトル未設定' }, if: -> { self.title.blank? }
end
