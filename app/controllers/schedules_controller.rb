class SchedulesController < ApplicationController
  def create
    puts params[:dates].first.to_date
    puts params[:title]
  end
end
