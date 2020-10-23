class SchedulesController < ApplicationController
  def create
    schedule = nil
    current_time = Time.current

    ActiveRecord::Base.transaction do
      schedule = Schedule.create(title: params[:title], created_at: current_time, updated_at: current_time)
      schedule_dates = params[:dates].map do |date|
        { date: date.to_date, schedule_id: schedule.id, created_at: current_time, updated_at: current_time }
      end
      ScheduleDate.insert_all!(schedule_dates)
    end

    render :json => schedule.to_json
  end
end
