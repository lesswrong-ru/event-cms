class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
	  t.string "title"
	  t.text "description"
	  t.boolean "visible", :default => false
	  t.date "date"
	  t.time "start_time"
	  t.time "finish_time"
      t.timestamps
    end
	add_index("sections", "start_time")
  end

  def down
    drop_table :sections
  end
end
