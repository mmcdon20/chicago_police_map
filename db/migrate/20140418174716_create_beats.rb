class CreateBeats < ActiveRecord::Migration
  def change
    create_table :beats do |t|
      t.string :beat
      t.integer :crimes

      t.timestamps
    end
  end
end
