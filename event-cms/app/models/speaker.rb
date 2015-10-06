class Speaker < ActiveRecord::Base

  scope :sorted, lambda {order("speakers.name ASC")}
  scope :search_by_name lambda {|query|
    where (["name LIKE ?", "%#{query}%"])
  }
  scope :search_by_desc lambda {|query|
    where (["description LIKE ?", "%#{query}%"])
  }


end
