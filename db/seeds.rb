require "faker"
# =========================================================
puts "Cleaning Request database..."
Request.destroy_all
puts "Cleaning Eventt database..."
Event.destroy_all
puts "Cleaning User database..."
User.destroy_all
# =========================================================
puts "Creating Users"
User.create!(first_name: "Peter", last_name: "the third", age: 28, user_name: "Pete", bio: "Something", email: "peter@circl.com", password: "123456")
User.create!(first_name: "Paul", last_name: "Wittchen", age: 26, user_name: "Paul", bio: "Something", email: "paul@circl.com", password: "123456")
User.create!(first_name: "Lil", last_name: "Vincent", age: 26, user_name: "Lil'V", bio: "Something", email: "lilv@circl.com", password: "123456")
User.create!(first_name: "Felipe", last_name: "Perez", age: 30, user_name: "Pipe", bio: "Let's rock it!", email: "felipe@circl.com", password: "123456")
puts "Users seeded!"
# =========================================================
puts "Seeding events..."
locations = ["Dorfstraße 2a, Straßlach", "Ottostraße 13, München", "Spervogelstraße 11, München",
             "Kaufingerstraße 12, München", "Tegernsee", "Starnbergersee", "Holbeinstraße 46, München",
             "Geiselgasteigstraße 88, München", "Georgenstraße, München", "Leopoldstraße, München"]

titles = ["BBQ at Isar", "Watching CL final", "Some beers after work!?", "Swimming at Starnberger See",
          "Dancing classes", "Theatre", "Sailing at Tegernsee", "Yoga in the parc", "Clubbing",
          "Tabletennis", "Weekendtrip to Gardasee", "Cinema"]

10.times do |i|
  event = Event.create!(
    user: User.all.sample,
    title: titles.sample,
    description: Faker::Lorem.paragraph_by_chars(number: 450, supplemental: false),
    location: locations.sample,
    event_date: Faker::Date.between(from: "2020-08-13", to: "2020-09-25"),
    event_time: "14:00",
  )
  event.save
end
puts "Events Seeded!"
# =========================================================
puts "Creating Requests"
# status_pool = ["pending", "accepted", "rejected"]
# p User.all.sample

15.times do
  request = Request.create!(
    user: User.all.sample,
    event: Event.all.sample,
    # status: status_pool.sample
    status: "pending",
  )
  request.save
end

puts "Requests seeded!"
