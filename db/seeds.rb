# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
  { name: 'Gary', age: 20 },
  { name: 'Matt', age: 21 },
  { name: 'Oliver', age: 22 }
].each do |employee|
  Employee.create!(employee)
end
