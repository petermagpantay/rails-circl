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

user = User.new(first_name: "Peter", last_name: "Heung-min", age: 28, user_name: "Sonny", bio: "New in Munich.", email: "peter@circl.com", password: "123456", instagram: "https://www.instagram.com/cristiano/?hl=de", linkedin: "https://www.linkedin.com/in/williamhgates")
image = URI.open("https://res.cloudinary.com/dgnfxdfou/image/upload/v1597852530/T02NE0241-U015LPGQYNS-80d1cf14873d-512_fwcqsf.jpg")
user.image.attach(io: image, filename: "user-profile-image", content_type: "image/jpg")
user.save
puts "Peter created"

user = User.create!(first_name: "Paul", last_name: "Wittchen", age: 26, user_name: "Paul", bio: "Former professional football player in the Bundesliga.", email: "paul@circl.com", password: "123456", instagram: "https://www.instagram.com/kimkardashian/?hl=de", linkedin: "https://in.linkedin.com/in/mark-zuckerberg-5b8a5212a")
image = URI.open("https://res.cloudinary.com/dgnfxdfou/image/upload/v1597852537/paul-wittchen_vactz5.png")
user.image.attach(io: image, filename: "user-profile-image", content_type: "image/jpg")
user.save
puts "Paul created"

user = User.create!(first_name: "Vincent", last_name: "Wittek", age: 20, user_name: "Lil'V", bio: "I am the God of code.", email: "lilv@circl.com", password: "123456", instagram: "https://www.instagram.com/realdonaldtrump/?hl=de", linkedin:"https://www.linkedin.com/showcase/warren-edward-buffett")
image = URI.open("https://res.cloudinary.com/dgnfxdfou/image/upload/v1597852539/66871244_mges0k.jpg")
user.image.attach(io: image, filename: "user-profile-image", content_type: "image/jpg")
user.save
puts "Vincent created"

user = User.create!(first_name: "Felipe", last_name: "Lugo", age: 30, user_name: "Pipe", bio: "Let's rock it!", email: "felipe@circl.com", password: "123456", instagram: "https://www.instagram.com/jeffbezos/", linkedin: "https://www.linkedin.com/showcase/jeff-bezos-newslines")
image = URI.open("https://res.cloudinary.com/dgnfxdfou/image/upload/v1597852535/T02NE0241-U016794N1R6-b862c16b2ec3-512_ztrqow.jpg")
user.image.attach(io: image, filename: "user-profile-image", content_type: "image/jpg")
user.save
puts "Felipe created"
puts "Users seeded!"

# =========================================================
titles = ["BBQ at Isar", "Watching CL final", "Beers after work", "Swimming at Starnberger See",
          "Bachata Dancing classes", "Theatre", "Sailing at Tegernsee", "Yoga at Westpark", "Clubbing",
          "Tabletennis", "Weekendtrip to Gardasee", "Cinema", "Chilling at a Lake"]

descriptions = ["This is a normal description for now, Vincent will work on more detailed and specialized desciption for each event tomorrow..."]

locations = ["Großhesseloher Brücke at Isar", "Dorfstraße 2a, Straßlach", "Ottostraße 13, Munich", "Starnberger See", "Spervogelstraße 11, Munich",
             "Kaufingerstraße 12, Munich", "Tegernsee", "Westpark", "Holbeinstraße 46, Munich",
             "Geiselgasteigstraße 88, Munich", "Gardasee", "Leopoldstraße, Munich", 
             "Markgrafenstraße 38, Berlin"]
             
images = ["https://res.cloudinary.com/dgnfxdfou/image/upload/v1597853657/Isar-Nord-c-M_C3_BCnchentv_bivqz8.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597853798/4706001_bjauj8.jpg",
          "https://res.cloudinary.com/dr9hgxsps/image/upload/v1597657237/munich_wiesn_hiwwws.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597853868/Slider_Starnberger-See_StarnbergAmmersee_baebwl.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597853926/bachata-picture-29.04.18_pwmksp.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597853985/bayerischestaatsoper-2480_xesj7s.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854028/2020-01-27-10_20_16-Window_aow0se.png",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854166/pexels-photo-1472887_c4laey.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854240/pexels-photo-1763075_c2o2wc.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854291/pexels-photo-976873_r6z17v.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854308/pexels-photo-1076767_tjbm4q.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854398/kino674_v-contentxl_wsrupi.jpg",
          "https://res.cloudinary.com/dgnfxdfou/image/upload/v1597854423/pexels-photo-747964_ifmi7c.jpg",
        ]

times = ["14:00", "18:00", "19:00", "20:30", "16:00", "19:00", "20:00", "19:30"]

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
    title: titles[i - 1],
    description: descriptions[0],
    location: locations[i - 1],
    event_date: Faker::Date.between(from: "2020-08-21", to: "2020-08-31"),
    event_time: times.sample
  )
  photo = URI.open(images[i - 1])
  event.photo.attach(io: photo, filename: "event-card-image", content_type: "image/jpg")
  event.save
  puts "#{i + 1}th Event created..."
end
puts "All Events seeded!"
# =========================================================
puts "Creating Requests"
# status_pool = ["pending", "accepted", "rejected"]
# p User.all.sample

15.times do |i|

  request = Request.create!(

    user: User.all.sample,
    event: Event.all.sample,
    # status: status_pool.sample
    status: "pending",
  )
  request.save
  puts "#{i + 1}th Request created..."
end

puts "Requests seeded!"
puts "All done \\(^w^)//"
