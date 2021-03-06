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
    if params[:dates].blank?
      return render json: { message: "Validation Error", errors: ['日程を選択してください'] }, status: 400
    end

    schedule = Schedule.new(title: params[:title])
    ActiveRecord::Base.transaction do
      if schedule.save
        current_time = Time.current
        schedule_dates = params[:dates].map do |date|
          { 
            date: Time.zone.parse(date).to_date,
            schedule_id: schedule.id, 
            created_at: current_time, 
            updated_at: current_time
          }
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
    schedule_member = ScheduleMember.new(schedule_id: schedule.id, name: params[:name])
    ActiveRecord::Base.transaction do
      if schedule_member.save
        current_time = Time.current
        schedule_member_schedule_dates = params[:date_ids].map do |date_id|
          { 
            schedule_member_id: schedule_member.id, 
            schedule_date_id: date_id, 
            created_at: current_time, 
            updated_at: current_time 
          }
        end
        if schedule_member_schedule_dates.present?
          ScheduleMemberScheduleDate.insert_all!(schedule_member_schedule_dates) 
        end
      else
        return render json: { message: "Validation Error", errors: schedule_member.errors.full_messages }, status: 400
      end
    end
    render json: schedule_member.to_json
  end
end
