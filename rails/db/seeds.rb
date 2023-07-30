# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require './db/seeds/admin_user'
require './db/seeds/user'
require './db/seeds/brand'
require './db/seeds/product'
require './db/seeds/bean'
require './db/seeds/review'
require './db/seeds/bean_review'
require './db/seeds/relationship'
require './db/seeds/report'
require './db/seeds/like'
require './db/seeds/news'
puts 'All data created!'
