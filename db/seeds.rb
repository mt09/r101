# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


o = User.new
o.email = "w@w.com"
o.name = "ww"
o.password = "qwerasdf"
o.password_confirmation = "qwerasdf"
o.save

p = User.new
p.email = "q@q.com"
p.name = "qq"
p.password = "qwerasdf"
p.password_confirmation = "qwerasdf"
p.save
