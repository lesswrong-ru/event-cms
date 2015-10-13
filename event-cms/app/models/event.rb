class Event < ActiveRecord::Base

  has_and_belongs_to_many :sections

  scope :newest_first, lambda {order("events.created_at DESC")}
  scope :search_by_name, lambda {|query|
    where (["name LIKE ?", "%#{query}%"])
  }
  scope :search_by_desc, lambda {|query|
    where (["description LIKE ?", "%#{query}%"])
  }

  # Getting event date info from sections' dates to admin view
  def self.display_date(event)
	dates  = event.sections.map {|section| section[:date]}
	start  = dates.min
	finish = dates.max
	if start
	  if start == finish || finish == nil
	    return "#{start.strftime("%d.%m.%Y")}"
	  else
	    return "#{start.strftime("%d.%m.%Y")} - #{finish.strftime("%d.%m.%Y")}"
	  end
	else
	  return "Isn't set"
	end
  end

  # Getting event date info from sections' dates to public view
  def self.display_show_date(event)
	dates  = event.sections.map {|section| section[:date]}
	start  = dates.min
	finish = dates.max
	if start
	  if start == finish
	    return "#{start.strftime("%A, %d %B")}"
	  else
	    return "#{start.strftime("%d %B")} - #{finish.strftime("%d %B")}"
	  end
	else
	  return "Isn't set"
	end
  end
  
  # Getting event timeframe from sections' timeframes
  def self.display_time(event)
	starts   = event.sections.map {|section| section[:start_time]}
	finishes = event.sections.map {|section| section[:finish_time]}
	start    = starts.min
	finish   = finishes.max
	if start
	  return "#{start.strftime("%H:%M")} - #{finish.strftime("%H:%M")}"
	else
	  return "Isn't set"
	end
  end
  
end
