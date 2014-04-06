class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.datetime :date
      t.string :case
      t.string :primary
      t.string :description
      t.string :beat
      t.string :district

      t.timestamps
    end
  end
end
