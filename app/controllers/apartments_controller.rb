
class ApartmentsController < ApplicationController

  def index
    @apartments = Apartment.all
  end

  def create
    finncode = params[:id].to_i
    apartment = Apartment.find_by_code(finncode)
    if !apartment
      apartment = Parser.new.parse(finncode)
      if apartment
        apartment.save
        render :json => { :status => "created" }
      else
        render :json => { :status => "error" }
      end
    else
      render :json => { :status => "exists" }
    end
  end

  def show
    @apartment = Apartment.find_by_code(params[:id].to_i)
  end

end


