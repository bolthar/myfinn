
class CommentsController < ApplicationController

  def show
    @comments = Comment.where(:apartment_id => params[:id].to_i)
    render :show, :layout => false
  end

  def save
    comment = Comment.new
    comment.text = params[:text]
    comment.apartment = Apartment.find(params[:apartment_id].to_i)
    comment.user = current_user
    if comment.save
      render :json => { :status => :ok }
    else
      render :json => { :status => comment.errors.first }
    end
  end

  def delete
    p "HERE"
    comment = Comment.find(params[:id].to_i)
    p comment
    comment.destroy
    render :json => { :status => :ok }
  end

end
