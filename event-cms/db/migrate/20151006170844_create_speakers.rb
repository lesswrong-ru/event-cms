class CreateSpeakers < ActiveRecord::Migration
  def up
    create_table :speakers do |t|
	  t.string "name"
	  t.text "description"
      t.timestamps
    end
	add_index("speakers", "name")
  end
  
  def down
    drop table :speakers
  end
end
