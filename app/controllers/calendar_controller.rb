
class CalendarController < ApplicationController

  def index
  end

  def events
    render :json => Appointment.valid.map { |x| x.to_calendar_event }
  end

end
