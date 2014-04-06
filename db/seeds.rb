# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("#{Rails.root}/lib/data/Crimes.csv", headers: true) do |crime|
  date = DateTime.strptime(crime['Date'],'%m/%d/%Y %H:%M:%S %p')
  Crime.create(date:        date,
               case:        crime['Case Number'],
               primary:     crime['Primary Type'],
               description: crime['Description'],
               beat:        crime['Beat'],
               district:    crime['District'])
end

