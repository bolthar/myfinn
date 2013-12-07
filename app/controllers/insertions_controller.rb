
class InsertionsController < ApplicationController

  def index
    @insertions = Insertion.where.("visualized = FALSE").order("created_at DESC")
  end

  def archive
    @insertions = Insertion.order("created_at DESC")
    render :index
  end

  def hide
    insertion = Insertion.find(params[:id])
    insertion.visualized = true
    insertion.save
    redirect_to :index
  end

  def hide_all
    Insertion.where("visualized = FALSE").each do |ins|
      ins.visualized = true
      ins.save
    end
    redirect_to :index
  end

  def promote
    insertion = Insertion.find(params[:id])
    insertion.apartment.to_be_considered = true
    insertion.apartment.save
    redirect_to apartment_path(insertion.apartment)
  end

end
