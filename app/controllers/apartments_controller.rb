
class ApartmentsController < ApplicationController

  ALREADY_EXIST = "Insertion already imported"

  def index
    @apartments = Apartment.all(:order => 'created_at DESC')
  end

  def create
    finncode = params[:id].to_i
    apartment = Apartment.find_by_code(finncode)
    if !apartment
      apartment = Parser.new.parse(finncode)
      if !apartment.kind_of?(String)
        apartment.user = current_user
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
  end

  def delete
    apartment = Apartment.find(params[:id].to_i)
    apartment.destroy
    redirect_to apartments_path
  end

end


