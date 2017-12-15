Photo.destroy_all
Profile.destroy_all
Category.destroy_all
User.destroy_all

adinda = User.create!(email: "adinda@gmail.com", password: "123456")
jeroen = User.create!(email: "jeroen@gmail.com", password: "123456")
lodie = User.create!(email: "lodie@gmail.com",  password: "123456")
frans = User.create!(email: "frans@gmail.com",  password: "123456")
serens = User.create!(email: "serena@gmail.com",  password: "123456")

food_and_drink = Category.create!(name: "Food & Drink")
outdoors = Category.create!(name: "Outdoors")
social = Category.create!(name: "Social")
active = Category.create!(name: "Active")
learning = Category.create!(name: "Learning")
games_and_sports = Category.create!(name: "Games & Sports")

event1 = Event.create!(
  name: "Dancing",
  description: "Come dance to some music",
  location: "Amsterdam",
  price: 5,
  capacity: 10,
  includes_food: false,
  includes_drinks: false,
  starts_at: DateTime.new(2018,1,15),
  ends_at: DateTime.new(2018,1,16),
  active: true,
  user: adinda,
  categories: [games_and_sports, social]
  )

event2 = Event.create!(
	name: "Game night",
	description: "One evening of old-fashioned board-games!",
	location: "Amsterdam",
	price: 5,
	capacity: 5,
	includes_food: false,
	includes_drinks: true,
	starts_at: DateTime.new(2018,2,1),
	ends_at: DateTime.new(2018,2,2),
	active: true,
	user: jeroen,
	categories: [social, games_and_sports]
)

event3 = Event.create!(
	name: "Workshop jewelry making",
	description: "I will explain some basics on how you can start making your own jewelry",
	location: "Amsterdam",
	price: 5,
	capacity: 8,
	includes_food: false,
	includes_drinks: false,
	starts_at: DateTime.new(2018,1,22),
	ends_at: DateTime.new(2018,1,24),
	active: true,
	user: adinda,
	categories: [learning]
)

event4 = Event.create!(
	name: "Family style diner",
	description: "Bored of eating alone, come join a family style diner with strangers.",
	location: "Zaandam",
	price: 15,
	capacity: 6,
	includes_food: true,
	includes_drinks: true,
	starts_at: DateTime.new(2018,1,13),
	ends_at: DateTime.new(2018,1,14),
	active: true,
	user: lodie,
	categories: [social, food_and_drink]
)

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/abohte/image/upload/v1513258664/images_ke8twn.jpg", event: event1)

Registration.new(event: event1, user: jeroen)
Registration.new(event: event4, user: adinda)
