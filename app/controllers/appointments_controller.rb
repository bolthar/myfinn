
require 'date'

class AppointmentsController < ApplicationController

  def show
    apartment = Apartment.find(params[:id].to_i)
    @appointment = apartment.appointment
    unless @appointment
      @appointment = Appointment.new
      @appointment.apartment = apartment
      @appointment.save
    end
    render :show, :layout => false
  end

  def update
    begin
    appointment = Appointment.find(params[:id].to_i)
    appointment.datetime = DateTime.parse("#{params[:date]} #{params[:time]}")
    appointment.reference_person = params[:person]
    appointment.notes = params[:notes]
    appointment.save
    render :json => { :status => "ok" }
    rescue Exception => ex
      render :json => { :status => "error" }
    end
  end
  
end
