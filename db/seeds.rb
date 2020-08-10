require "faker"

puts "Cleaning database..."
Event.destroy_all

puts "Creating Users"
User.create(first_name: "Peter", last_name: "the third", age: 28, user_name: "Pete", bio: "Something", email: "peter@circl.com", password: "123456")
User.create(first_name: "Paul", last_name: "Wittchen", age: 26, user_name: "Paul", bio: "Something", email: "paul@circl.com", password: "123456")
puts "Users created"

puts 'Creating 10 events...'
10.times do |i|
  event = Event.create!(
    user: User.all.sample,
    title: Faker::Lorem.question(word_count: 10, supplemental: false),
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    location: Faker::Address.full_address,
    event_date: Faker::Date.between(from: "2020-08-01", to: "2020-12-31"),
    event_time: "14:00"
  )
  event.save
end
puts 'Finished!'
