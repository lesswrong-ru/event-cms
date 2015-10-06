class Section < ActiveRecord::Base

  scope :visible,		lambda {where(:visible => true)}
  scope :invisible,		lambda {where(:visible => false)}
  scope :sorted, 		lambda {order("sections.name ASC")}
  scope :newest_first	lambda {order("sections.created_at DESC")}
  scope :search_by_name lambda {|query|
    where (["name LIKE ?", "%#{query}%"])
  }
  scope :search_by_desc lambda {|query|
    where (["description LIKE ?", "%#{query}%"])
  }

end
