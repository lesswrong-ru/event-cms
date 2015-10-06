class CreateEventsSectionsJoin < ActiveRecord::Migration
  def up
    create_table :events_sections, :id => false do |t|
	  t.integer "event_id"
	  t.integer "section_id"
    end
	add_index :events_sections, ["event_id", "section_id"]
  end
  
  def down
    drop_table :events_sections
  end
end
