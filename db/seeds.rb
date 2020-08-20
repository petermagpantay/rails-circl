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
          "Tabletennis tournament", "Weekendtrip to Gardasee", "Cinema", "Chilling at a Lake"]

descriptions = ["Hey there! I would like to have BBQ this weekend, and I think the Isar is the perfect place for that. There is a bridge called `Großhesseloher-brücke` in Munich, and I thinkt that it is the perfect place to grill. I have a grill I can bring, and it would be awesome if everybody could bring some meat or other stuff we can put on it. Apart from that, dont worry about anything and just relax together :D",
                "Hi guys, as you all know this Sunday there is the Championsleague final between FC Bayern and PSG, and I would love to watch it. The friends I normally watch football with are out of town, so I am searching for people who would watch it with me. The only thing you need to bring is some drink, a love for football and enthusiasm.",
                "If you are thirsty after a long day of work, come and join us and enjoy a few nice beers! Me and two other friends do it all the time, and we would love to meet some new people, so if you are interested dont hesitate to join.",
                "Have you ever swom at the Starnberger See? Its an awesome place, and I am planning to go there on Friday afternoon. Anybody who also wants to join me is absolutely welcome ^^.",
                "Hi there! I am an enthusiastic Bachata dancer, and I am looking for people to dance with. If you are not experienced or have no idea what Bachata is at all, dont worry, I love to teach it as well! All you need is some groove and love for dancing!",
                "Hello, I have 4 tickets for a theater event next week, but nobody who is able to go with me right now. I am therefore searching for other people who are as interested as me as going to it, so we can go together. The ticket would then be a gift by me, so dont worry about anything and just enjoy the show ;).",
                "Hello guys, is anybody here interested in going sailing with me on the weekend. I have a nice boat called 'Augustina', and I would love to invite people on it as well. Just come and relax with me on it, if you know how to sail a bit thats a big bonus of course ;).",
                "Hey there! I am looking for people I can do Yoga with in the Westpark on Saturday. No matter how skilled you are, we can do some exercises together and enjoy ourself. The whole thing will take about 2 hours, but we can come and leave whenever you want or course!",
                "Who here is interested in going to some clubs on Friday evening? Me and a friend of mine will be going and we are looking for people to join us. Just write me a message for the details :D.",
                "Hey guys, how about a tabletennis tournament on Thursday evening? I have a table at home we can play on, the only thing you need to bring is maybe some snacks. We will be about 6 people and have an awesome tournament, may the best win!",
                "Guten Morgen, I am a 26 year old guy from Finland who is working on a project here in Munich at the moment. This weekend, I would love to have a trip to Gardasee to chill out and swim. I would be happy if anybody else would like to join me, we will be sleeping at a local hotel which is located real close to it and is not very expensive.",
                "Hey there, who is interested in going to the cinema together with me? As there are a few good movies on at the moment, we could just choose one and agree on a time together!",
                "Hello, who is interested at joing me to go chilling at a lake here in Munich? If you are interested, just write me."]

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

user_ids = [0,1,3,1,0,3,1,0,0,1,3,1,3]

category_ids = [[4,5],[2,5],[5,3],[6,7],[2,3,6],[3,7],[2,5,6,7],[2,6],[4,5,6],[2,5],[3,6,7],[1,5,7],[1,6,7]]


puts "Seeding categories..."
categories.each do |category|
  Category.create!(name: category)
  puts "Created #{category}"
end
puts "Categories seeded"

puts "Seeding events..."

13.times do |i|
      #puts category_ids[i-1][]
  event = Event.new(
    user: User.all[user_ids[i]],
    title: titles[i - 1],
    description: descriptions[i-1],
    location: locations[i - 1],
    #categories: Category.all[5,6],
    categories: Category.all[category_ids[i-1][0],category_ids[i-1][1]],


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
