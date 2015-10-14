class Section < ActiveRecord::Base

  has_and_belongs_to_many :events
  has_and_belongs_to_many :speakers
  has_and_belongs_to_many :tags
  
  scope :visible,		lambda {where(:visible => true)}
  scope :invisible,		lambda {where(:visible => false)}
  scope :sorted, 		lambda {order("sections.name ASC")}
  scope :newest_first,	lambda {order("sections.created_at DESC")}
  scope :sorted_by_starting_time, lambda {order("date ASC, sections.start_time ASC")}
  scope :search_by_name, lambda {|query|
    where (["name LIKE ?", "%#{query}%"])
  }
  scope :search_by_desc, lambda {|query|
    where (["description LIKE ?", "%#{query}%"])
  }

  # Displaying section timeframe from start_time and finish_time
  def self.display_time(section)
    if section.start_time
	  return "#{section.start_time.strftime("%H:%M")} - #{section.finish_time.strftime("%H:%M")}"
    end
  end
  
  # Displaying section timeframe from start_time and finish_time
  def self.display_date(section)
    if section.date
	  return "#{section.date.strftime("%d.%m.%Y")}"
    else
    end
  end
  
  def self.display_speakers(section)
    section.speakers.collect(&:name).join(", ")
  end
  
end
