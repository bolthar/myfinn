
class FilterController < ApplicationController

  def update
    url = params[:filter_url]
    Filter.destroy_all
    filter = Filter.new
    filter.url = url
    filter.save
    redirect_to :action => :index, :controller => :insertions
  end

end
