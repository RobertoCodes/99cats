class CatRentalRequest < ActiveRecord::Base

  validate :overlapping_approved_requests


def overlapping_requests
  # @overlaps = Cat.joins(:cat_rental_requests).where.not("cat_rental_requests.cat_id = ?
  #  AND ? < cat_rental_requests.start_date OR cat_rental_requests.end_date < ?",
  #  self.cat_id, self.end_date, self.start_date)
  CatRentalRequest
    .where("(:id IS NULL) OR id != :id", id: self.id)
    .where("cat_id = ?", self.cat_id)
    .where
    .not("? < cat_rental_requests.start_date OR cat_rental_requests.end_date < ?", self.end_date, self.start_date)
end

def overlapping_approved_requests
  result = overlapping_requests.where("cat_rental_requests.status = 'APPROVED'")
  unless result.empty?
    errors[:overlapping_requests] << "Rental request dates overlap with another rental"
  end
end

def overlapping_pending_requests
  overlapping_requests.where("cat_rental_requests.status = 'PENDING'")
end

def approve!
  transaction do
    self.status = "APPROVED"
    self.update!
    overlapping_pending_requests.each { |request| request.deny! }
  end
end

def deny!
  self.status = "DENIED"
  self.update!
end

def pending?
  status == "PENDING"
end

belongs_to :cat,
  :dependent => :destroy,
  foreign_key: :cat_id,
  primary_key: :id,
  class_name: "Cat"



end
