
class ApartmentsController < ApplicationController

  ALREADY_EXIST = "Insertion already imported"

  def index
    @filter = params[:status] ? params[:status].to_i : 3
    @apartments = Apartment.where("status <= ? AND to_be_considered = ?", @filter, true).order("rating DESC, created_at DESC")
  end

  def create
    finncode = params[:id].to_i
    apartment = Apartment.find_by_code(finncode)
    if !apartment
      apartment = Parser.new.parse(finncode)
      if !apartment.kind_of?(String)
        apartment.user = current_user
        apartment.to_be_considered = true
        apartment.save
        render :json => { :status => "ok", :id => apartment.id }
      else
        render :json => { :status => apartment }
      end
    else
      render :json => { :status => ALREADY_EXIST }
    end
  end

  def show
    @apartment = Apartment.find(params[:id].to_i)
    @title = "#{@apartment.title} - #{SITE_NAME}"
  end

  def delete
    apartment = Apartment.find(params[:id].to_i)
    apartment.destroy
    redirect_to apartments_path
  end

  def rating
    return unless current_user.admin
    rating = params[:value]
    apartment = Apartment.find(params[:id].to_i)
    apartment.rating = rating
    apartment.save
    render :json => { :result => "ok", :rating => apartment.rating }
  end

  def status
    return unless current_user.admin
    apartment = Apartment.find(params[:id].to_i)
    apartment.status = params[:value].to_i
    apartment.save
    render :json => { :result => "ok" }
  end

end


