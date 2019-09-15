class ListsController < ApplicationController
  def index
  end
  def new
  	@list = List.new
  end
  def create
  	@list = List.new(list_params)
  	if @list.save
    	flash[:success] = "List has been created successfully"
    	redirect_to lists_path
    else
      flash[:danger] = "List has not been created"
      render :new
    end
  end
  
  private
  	def list_params
  		params.require(:list).permit(:name) 
	end

end
