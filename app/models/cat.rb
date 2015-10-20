class Cat < ActiveRecord::Base

  def age
    month,day,year = self.birth_date.split("-").map(&:to_i)
    Date.today.year - year
  end

end
