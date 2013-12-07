
class InsertionsController < ApplicationController

  def index
    @insertions = Insertion.where("visualized = ?", false).order("created_at")
  end

  def archive
    @insertions = Insertion.order("created_at DESC")
    render :index
  end

  def hide
    insertion = Insertion.find(params[:id])
    insertion.visualized = true
    insertion.save
    redirect_to insertions_path
  end

  def hide_all
    Insertion.where("visualized = FALSE").each do |ins|
      ins.visualized = true
      ins.save
    end
    redirect_to insertions_path
  end

  def promote
    insertion = Insertion.find(params[:id])
    insertion.apartment.to_be_considered = true
    insertion.apartment.user = current_user
    insertion.visualized = true
    insertion.save
    insertion.apartment.save
    redirect_to :controller => :apartments, :action => :show, :id => insertion.apartment.id
  end

end
