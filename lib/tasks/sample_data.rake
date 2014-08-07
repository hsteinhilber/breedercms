namespace :db do
  desc "Fill database with sample data"
  task populate: [:environment, :reset] do
    SiteSettings.title = "Breeder CMS"
    SiteSettings.species = "dog"
    SiteSettings.baby_species = "puppy"
    SiteSettings.breed = "siberian husky"
    SiteSettings.short_breed = "husky"
    SiteSettings.feedback_email = "harry.steinhilber@live.com"

    # Add base static pages to database
    StaticPage.create!(title: "Home", subtitle: "Breeder CMS",
                      content: Faker::Lorem.paragraph(3));
    StaticPage.create!(title: "About Us", subtitle: Faker::Lorem.words(6),
                       content: Faker::Lorem.paragraph(3));

    t = Pet.create!( name:       'Tapanga Mae Steinhilber',
                     birth_date: '2011-12-28',
                     profile_picture: File.open('./spec/support/Tapanga.jpg'),
                     gender:     'F',
                     color:      'Silver',
                     eye_color:  'Brown',
                     breed:      'Siberian Husky',
                     height:     23,
                     weight:     53.5,
                     status:     :owned,
                     description: "A simple description of a beautiful dog")
    t.photos.create!(caption: "Tapanga running around", 
                     image: File.open('./spec/support/photo1.jpg'))
    t.photos.create!(caption: "Tapanga sleeping", 
                     image: File.open('./spec/support/photo2.jpg'))
    t.photos.create!(caption: "Tapanga eating", 
                     image: File.open('./spec/support/photo3.jpg'))
    t.photos.create!(caption: "Tapanga playing with a ball", 
                     image: File.open('./spec/support/photo4.jpg'))
    
    # Add additional pets to database
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
                   status:     :owned,
                   description: Faker::Lorem.paragraph(2))
    end

    # Add litters to database
    l = t.litters.create!(birth_date: '2013-1-1', father_id: Pet.last.id)
    l.pets << Pet.all[2]
    l.pets << Pet.all[3]

    l = t.litters.create!(birth_date: '2013-7-1', father_id: Pet.all[1].id)
    l.pets << Pet.all[4]
    l.pets << Pet.all[5]
    l.pets << Pet.all[6]
    l.pets << Pet.all[7]

    Pet.all.each do |p|
      unless p.litter_id.nil?
        p.status = rand(2) == 0 ? :adopted : :available
        p.save
      end
    end
  end
end
