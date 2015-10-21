class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, :user_id, presence:true

  def age
    year,month,day = self.birth_date.split("-").map(&:to_i)
    Date.today.year - year
  end


  has_many :rental_requests,
    foreign_key: :cat_id,
    primary_key: :id,
    class_name: "CatRentalRequest"

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :user_id
  )

end
