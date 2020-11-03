class Schedule < ApplicationRecord
  has_many :schedule_dates
  has_many :schedule_members

  validates :title, presence: true
  before_validation :set_default_title

  private

  def set_default_title
    self.title = 'タイトル未設定' if self.title.blank?
  end
end
