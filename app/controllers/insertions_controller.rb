
class InsertionsController < ApplicationController

  def index
    @insertions = Insertion.order("created_at DESC")
  end

end
