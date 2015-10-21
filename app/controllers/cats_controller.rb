require 'byebug'
class CatsController < ApplicationController

before_action :editor_owns_cat, only: [:edit,:update]

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
    @cat.owner = current_user
    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end

  end

  def editor_owns_cat
    @cat = Cat.find(params[:id])
    unless current_user.cats.exists?(id: @cat.id)
      @cat.errors.add(:user_id, "User does not own cat")
      redirect_to cats_url(@cat.id)
    end
  end


  private
    def cat_params
      params.require(:cat).permit( :birth_date, :color, :name, :sex, :description, :user_id )
    end
end
