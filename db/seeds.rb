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
User.create!(first_name: "Peter", last_name: "the third", age: 28, bio: "Something", email: "peter@circl.com", password: "123456")
User.create!(first_name: "Paul", last_name: "Wittchen", age: 26, bio: "Something", email: "paul@circl.com", password: "123456")
User.create!(first_name: "Lil", last_name: "Vincent", age: 20, bio: "Something", email: "lilv@circl.com", password: "123456")
User.create!(first_name: "Felipe", last_name: "Perez", age: 30, bio: "Let's rock it!", email: "felipe@circl.com", password: "123456")
puts "Users seeded!"
# =========================================================
locations = ["Dorfstraße 2a, Straßlach", "Ottostraße 13, Munich", "Spervogelstraße 11, Munich",
             "Kaufingerstraße 12, Munich", "Tegernsee", "Starnbergersee", "Holbeinstraße 46, Munich",
             "Geiselgasteigstraße 88, Munich", "Georgenstraße, Munich", "Leopoldstraße, Munich", 
             "Markgrafenstraße 38, Berlin", "Chausseestraße 49, Berlin", "Lichtenberger Str. 31, Berlin"]

titles = ["BBQ at Isar", "Watching CL final", "Some beers after work!?", "Swimming at Starnberger See",
          "Dancing classes", "Theatre", "Sailing at Tegernsee", "Yoga in the parc", "Clubbing",
          "Tabletennis", "Weekendtrip to Gardasee", "Cinema", "Chilling at the Lake"]

categories = ["Food", "Adventure", "Sport", "Party", "Games", "Swimming", "Culture", "Drinking", "Vacation"]

puts "Seeding categories..."
categories.each do |category|
  Category.create!(name: category)
  puts "Created #{category}"
end
puts "Categories seeded"

puts "Seeding events..."
13.times do |i|
  event = Event.create!(
    user: User.all.sample,
    title: titles.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 450, supplemental: false),
    location: locations.sample,
    event_date: Faker::Date.between(from: "2020-08-21", to: "2020-09-25"),
    event_time: "14:00",
  )
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
