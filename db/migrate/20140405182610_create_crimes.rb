class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.datetime :date
      t.string :case
      t.string :primary
      t.string :description
      t.string :beat
      t.string :district
      t.float  :latitude
      t.float  :longitude

      t.timestamps
    end
  end
end
