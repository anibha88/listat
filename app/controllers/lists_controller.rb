class ListsController < ApplicationController
  def index
  end
  def new
  	@list = List.new
  end
  def create
  	@list = List.new(list_params)
  	@list.save
  	flash[:success] = "List has been created successfully"
  	redirect_to lists_path
  end
  
  private
  	def list_params
  		params.require(:list).permit(:name) 
	end

end
