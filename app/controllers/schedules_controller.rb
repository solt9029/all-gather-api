class SchedulesController < ApplicationController
  def create
    dates = params[:dates].map { |date| date.to_date }
    ActiveRecord::Base.transaction do
      current_time = Time.current
      schedule = Schedule.create(title: params[:title], created_at: current_time, updated_at: current_time)
      schedule_dates = params[:dates].map do |date|
        { date: date.to_date, schedule_id: schedule.id, created_at: current_time, updated_at: current_time }
      end
      ScheduleDate.insert_all!(schedule_dates)
    end
  end
end
