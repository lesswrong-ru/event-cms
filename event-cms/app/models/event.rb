class Event < ActiveRecord::Base

  scope :newest_first	lambda {order("events.created_at DESC")}
  scope :search_by_name lambda {|query|
    where (["name LIKE ?", "%#{query}%"])
  }
  scope :search_by_desc lambda {|query|
    where (["description LIKE ?", "%#{query}%"])
  }

end
