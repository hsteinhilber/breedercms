namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    t = Pet.create!( name:       'Tapanga Mae Steinhilber',
                     birth_date: '2011-12-28',
                     profile_picture: File.open('./spec/support/Tapanga.jpg'),
                     gender:     'F',
                     color:      'Silver',
                     eye_color:  'Brown',
                     breed:      'Siberian Husky',
                     height:     23,
                     weight:     53.5,
                     description: "A simple description of a beautiful dog")
    t.photos.create!(caption: "Tapanga running around", 
                     image: File.open('./spec/support/photo1.jpg'))
    t.photos.create!(caption: "Tapanga sleeping", 
                     image: File.open('./spec/support/photo2.jpg'))
    t.photos.create!(caption: "Tapanga eating", 
                     image: File.open('./spec/support/photo3.jpg'))
    t.photos.create!(caption: "Tapanga playing with a ball", 
                     image: File.open('./spec/support/photo4.jpg'))

    8.times do |n|
      Pet.create!( name:       Faker::Name.name,
                   birth_date: Date.today - (rand(730) + 182),
                   profile_picture: File.open("./spec/support/Profile#{n % 8 + 1}.jpg"),
                   gender:     rand(2) == 0 ? 'M' : 'F',
                   color:      Faker::Commerce.color,
                   eye_color:  Faker::Commerce.color,
                   breed:      Faker::Lorem.word,
                   height:     10 + rand(30),
                   weight:     15 + rand() * 50,
                   description: Faker::Lorem.paragraph(2))
    end
  end
end
