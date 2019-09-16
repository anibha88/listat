class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
  	@list = List.new
  end

  def create
  	@list = List.new(list_params)
  	if @list.save
    	flash[:notice] = "List has been created successfully"
    	redirect_to lists_path
    else
      flash.now[:danger] = "List has not been created"
      render :new
    end
  end

  def show
    @list_item = @list.list_items.build
    @list_items = @list.list_items
  end

  def edit
    
  end

  def update
    if @list.update(list_params)
      flash[:notice] = "List has been updated"
      redirect_to @list
    else
      flash.now[:danger] = "List has not been updated"
      render :edit
    end
  end

  def destroy
    if @list.destroy
      flash[:notice] = "List has been deleted"
      redirect_to lists_path
    end
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

    def set_list
      @list = List.find(params[:id])
    end

end
