require "open-uri"
require "faker"
# =========================================================
puts "Cleaning Request database..."
Request.destroy_all
puts "Cleaning Event database..."
Event.destroy_all
puts "Cleaning User database..."
User.destroy_all
# =========================================================
puts "Creating Users"

User.create!(first_name: "Peter", last_name: "Heung-min", age: 28, user_name: "Sonny", bio: "New in Munich.", email: "peter@circl.com", password: "123456")
User.create!(first_name: "Paul", last_name: "Wittchen", age: 26, user_name: "Paul", bio: "Former professional football player in the Bundesliga.", email: "paul@circl.com", password: "123456")
User.create!(first_name: "Vincent", last_name: "Wittek", age: 23, user_name: "Lil'V", bio: "I am the God of code.", email: "lilv@circl.com", password: "123456")
User.create!(first_name: "Felipe", last_name: "Lugo", age: 30, user_name: "Pipe", bio: "Let's rock it!", email: "felipe@circl.com", password: "123456")

puts "Users seeded!"
# =========================================================
locations = ["Dorfstraße 2a, Straßlach", "Ottostraße 13, Munich", "Spervogelstraße 11, Munich",
             "Kaufingerstraße 12, Munich", "Tegernsee", "Starnberger See", "Holbeinstraße 46, Munich",
             "Geiselgasteigstraße 88, Munich", "Georgenstraße, Munich", "Leopoldstraße, Munich", 
             "Markgrafenstraße 38, Berlin", "Chausseestraße 49, Berlin", "Lichtenberger Str. 31, Berlin"]

titles = ["BBQ at Isar", "Watching CL final", "Beers after work", "Swimming at Starnberger See",
          "Bachata Dancing classes", "Theatre", "Sailing at Tegernsee", "Yoga at Westpark", "Clubbing",
          "Tabletennis", "Weekendtrip to Gardasee", "Cinema", "Chilling at the Lake"]

images = ["https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657238/munich_olympia_pvwcne.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657238/munich_allianz_niqigv.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657237/munich_eisbach_qnrdln.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657237/munich_wiesn_hiwwws.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657237/munich_nymphenburg_hbbpzv.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657237/munich_hofgarten_ngotw9.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657237/munich_bmw_fr29e2.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657236/munich_biergarten_mruszn.jpg"]

categories = ["Food", "Sports", "Culture", "Party", "Drinks", "Adventure", "Sightseeing"]

puts "Seeding categories..."
categories.each do |category|
  Category.create!(name: category)
  puts "Created #{category}"
end
puts "Categories seeded"

puts "Seeding events..."

13.times do |i|
  event = Event.new(
    user: User.all.sample,
    title: titles.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 450, supplemental: false),
    location: locations.sample,
    event_date: Faker::Date.between(from: "2020-08-21", to: "2020-08-31"),
    event_time: "14:00",
    category: categories.sample
  )
  photo = URI.open(images.sample)
  event.photo.attach(io: photo, filename: "event-card-image", content_type: "image/jpg")
  event.save
end
puts "Events seeded!"
# =========================================================
puts "Creating Requests"
# status_pool = ["pending", "accepted", "rejected"]
# p User.all.sample

10.times do
  request = Request.create!(
    user: User.all.sample,
    event: Event.all.sample,
    # status: status_pool.sample
    status: "pending",
  )
  request.save
end

puts "Requests seeded!"
