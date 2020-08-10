require "faker"

puts "Cleaning database..."
Event.destroy_all

puts 'Creating 10 events...'
10.times do |i|
  event = Event.create!(
    title: Faker::Lorem.question(word_count: 5, supplemental: false),
    description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
    location: Faker::Address.full_address,
    event_date: Faker::Date.between(from: "2020-08-01", to: "2020-08-31"),
    event_time: "14:00"
  )
  puts "#{i + 1}. #{event.title}"
end
puts 'Finished!'
