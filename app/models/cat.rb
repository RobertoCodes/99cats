class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence:true

  def age
    year,month,day = self.birth_date.split("-").map(&:to_i)
    Date.today.year - year
  end

end
