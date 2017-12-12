User.destroy_all

adinda = User.create!(email: "adinda@gmail.com", password: "123456")
jeroen = User.create!(email: "jeroen@gmail.com", password: "654321")

Event.create!(
name: "Dancing",
description: "Come dance to some music",
location: "Amsterdam",
price: 5,
capacity: 10,
includes_food: false,
includes_drinks: false,
starts_at: DateTime.new(2018,1,15,21,30),
ends_at: DateTime.new(2018,1,16,02,30),
active: true,
user: adinda
  )
