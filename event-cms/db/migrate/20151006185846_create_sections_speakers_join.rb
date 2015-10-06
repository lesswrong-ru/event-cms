class CreateSectionsSpeakersJoin < ActiveRecord::Migration
  def up
    create_table :sections_speakers, :id => false do |t|
	  t.integer "section_id"
	  t.integer "speaker_id"
    end
	add_index :sections_speakers, ["section_id", "speaker_id"]
  end
  
  def down
    drop_table :sections_speakers
  end
end
