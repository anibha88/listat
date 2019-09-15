class ListsController < ApplicationController
  def index
    @lists = List.all
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
      flash.now[:danger] = "List has not been created"
      render :new
    end
  end
  def show
    @list = List.find(params[:id])
  end
  
  protected
    def resource_not_found
      message = "The list you are looking for could not be found"
      flash[:alert] = message
      redirect_to root_path
    end
    
  private
  	def list_params
  		params.require(:list).permit(:name) 
	  end

end
