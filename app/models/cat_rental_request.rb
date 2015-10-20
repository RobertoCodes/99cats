class CatRentalRequest < ActiveRecord::Base


# def overlapping_requests
#   @overlaps = Cat.joins(:cat_rental_requests).where.not
#   ("cat_rental_requests.cat_id = ? AND cat_rental_requests.start_date < ? AND cat_rental_requests.end_date > ?",
#    cat_rental_params[:cat_id], cat_rental_params[:start_date], car_rental_params[:end_date] )
# end

def overlapping_approved_requests


end

belongs_to :cat,
  :dependent => :destroy,
  foreign_key: :cat_id,
  primary_key: :id,
  class_name: "Cat"




end
