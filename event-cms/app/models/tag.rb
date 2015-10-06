class Tag < ActiveRecord::Base

  has_and_belongs_to_many :sections
  
  scope :search_by_name, lambda {|query|
    where (["name LIKE ?", "%#{query}%"])
  }

end
