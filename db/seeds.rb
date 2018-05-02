# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#<Vendor id: 1, first_name: "Nancy", last_name: "Monroe", organization: "Paper Printers", phone: "(855) 895-0031", email: "nancy.monroe@paper_printers.com", blanket_order_number: "BC70431", created_at: "2018-01-16 21:38:03", updated_at: "2018-01-16 21:38:03"

100.times do |i|
  name = Faker::HarryPotter.character
  first_name = name.partition(" ").first
  last_name = name.partition(" ").last

  email = first_name+"."+last_name+"@"+Faker::Internet.domain_name

  phone = Faker::PhoneNumber.cell_phone

  vendor = Vendor.create(first_name: first_name, last_name: last_name, organization: Faker::HitchhikersGuideToTheGalaxy.location, email: email, phone: phone, blanket_order_number: Faker::Internet.password(7))

  vendor.save! 
end

#<Client id: 1, first_name: "Nancy", last_name: "Monroe", organization: "Paper Printers", phone: "(855) 895-0031", email: "nancy.monroe@paper_printers.com", created_at: "2018-01-16 21:38:03", updated_at: "2018-01-16 21:38:03"

100.times do |i|
  name = Faker::StarWars.character
  first_name = name.partition(" ").first
  last_name = name.partition(" ").last

  email = first_name+"."+last_name+"@"+Faker::Internet.domain_name

  phone = Faker::PhoneNumber.cell_phone

  client = Client.create(first_name: first_name, last_name: last_name, organization: Faker::HitchhikersGuideToTheGalaxy.location, email: email, phone: phone)

  client.save! 
end