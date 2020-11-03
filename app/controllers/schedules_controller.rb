class SchedulesController < ApplicationController
  def show
    if schedule = Schedule.preload(:schedule_dates, schedule_members: :schedule_dates).find_by(id: params[:id])
      return render json: schedule.to_json(include: {
        schedule_dates: {}, 
        schedule_members: {
          include: {
            schedule_dates: {}
          }
        }
      })
    end
    render json: { message: "Not Found Error", errors: [] }, status: 404
  end

  def create
    schedule = Schedule.new(title: params[:title])
    ActiveRecord::Base.transaction do
      if schedule.save
        current_time = Time.current
        schedule_dates = params[:dates].map do |date|
          { date: date.to_date, schedule_id: schedule.id, created_at: current_time, updated_at: current_time }
        end
        ScheduleDate.insert_all!(schedule_dates)
      else
        return render json: { message: "Validation Error", errors: schedule.errors.full_messages }, status: 400
      end
    end
    render json: schedule.to_json
  end

  def answer
    schedule = Schedule.find(params[:id])

    ActiveRecord::Base.transaction do
      
    end
  end
end
