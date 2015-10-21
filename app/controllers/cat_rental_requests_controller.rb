class CatRentalRequestsController < ApplicationController
  def index
    @catrentalrequest = CatRentalRequest.all

    render :index

  end

  def show
    # @cat = Cat.find(@catrental )
    # @catrentalrequest = CatRentalRequest.find(params[:id])
    # render :show

  end

  def new
    @cats = Cat.all
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_params)

    if @cat_rental_request.save
      redirect_to cat_url(cat_rental_params[:cat_id])
    else
      render json: @cat_rental_request.errors.full_messages, status: :unprocessable_entity
    end

  end

  def approve!
    CatRentalRequest.find(params[:id]).approve!
    
    render :new
  end

  private
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)

  end

end
