class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|

      t.timestamps
    end
  end
end
