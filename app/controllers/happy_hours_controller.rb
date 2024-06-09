class HappyHoursController < ApplicationController
  def index
    @happy_hours = HappyHour.all
  end

  def show
    logger.debug "Params ID: #{params[:id]}"
    @happy_hour = HappyHour.find(params[:id])
    @timings = @happy_hour.happy_hour_timings
  end
end
