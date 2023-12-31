class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params) # List.new(params[:list])
    if @list.save
      redirect_to lists_path(@list) # redirect_to lists_path(@lists)
    else
      render :new, status: unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
