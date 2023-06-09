class CatsController < ApplicationController
  def index
    @cats = Cat.all.order(:id)
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    
  end

  private
  def cat_params
    params.require(:cat).permit(:birth_date, :color, :sex, :name, :description)
  end
end