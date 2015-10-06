class CreateSectionsTagsJoin < ActiveRecord::Migration
  def up
    create_table :sections_tags, :id => false do |t|
	  t.integer "section_id"
	  t.integer "tag_id"
    end
	add_index :sections_tags, ["section_id", "tag_id"]
  end
  
  def down
    drop_table :sections_tags
  end
end
