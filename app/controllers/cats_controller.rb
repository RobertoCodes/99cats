require 'byebug'
class CatsController < ApplicationController

  def index
    @cats = Cat.all

    render :index

  end

  def show
    @cat = Cat.find(params[:id])
    @rentals = @cat.rental_requests.order(:start_date)
    render :show

  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    updated = @cat.update(cat_params)
    if updated
      @cat.update!(cat_params)
      render :show
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end

  end


  private
    def cat_params
      params.require(:cat).permit( :birth_date, :color, :name, :sex, :description )
    end
end
