# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Bargain.destroy_all
Offer.destroy_all
Store.destroy_all
Proposer.destroy_all

#10.times do |i|
#Proposer.create!()
#end

p1 = Proposer.create(
  full_name: "Иллария Мультиваркина",
  email: "illary_m@mail.ru",
  password: "Multi09",
  additional_information: "Я делаю искусственные цветы из разных материалов, звоните: +7 8883333876")

p2 = Proposer.create(
  full_name: "Леопольд Цветочкин",
  email: "solitory_lion@mail.ru",
  password: "123LEO456")

o1 = p1.offers.create(
  name: "Искуственная роза",
  measure: "шт",
  price: 300,
  description: "",
  is_active: true
)

s1 = Store.create(
  name: "ФлауэрХаус",
  address: "г. Ростов-на-Дону, ул. Розы Люксембург, д. 5",
  description: "Цветочки в каждый дом",
  store_email: "flowerhouse@mail.ru",
  store_password: "ffflll123"
)

s1.bargains.create(
  offer: o1,
  status: "Accepted",
  date: Date.today
)

puts "First records for database were attached"


