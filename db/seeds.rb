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
puts "Users seeded!"
# =========================================================
puts "Seeding events..."
10.times do |i|
  event = Event.create!(
    user: User.all.sample,
    title: Faker::Lorem.question(word_count: 3, supplemental: false),
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    location: Faker::Address.full_address,
    event_date: Faker::Date.between(from: "2020-08-01", to: "2020-12-31"),
    event_time: "14:00",
  )
  event.save
end
puts "Events Seeded!"
# =========================================================
puts "Creating Requests"
status_pool = ["pending", "accepted", "rejected"]
# p User.all.sample

50.times do
  request = Request.create!(
    user: User.all.sample,
    event: Event.all.sample,
    status: status_pool.sample
  )
  request.save
end

puts "Requests seeded!"
