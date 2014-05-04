FactoryGirl.define do
  factory :pet do
    sequence(:name)        { |n| Faker::Name.name }
    sequence(:birth_date)  { |n| (Date.today - (Random.rand(730) + 182)) }
    sequence(:profile_picture) { |n| File.open("./spec/support/Profile#{n % 8 + 1}.jpg") }
    sequence(:gender)      { |n| Random.rand(2) == 0 ? 'M' : 'F' }
    sequence(:color)       { |n| Faker::Commerce.color }
    sequence(:eye_color)   { |n| Faker::Commerce.color }
    sequence(:breed)       { |n| Faker::Lorem.word }
    sequence(:height)      { |n| 10 + Random.rand(30) }
    sequence(:weight)      { |n| 15 + Random.rand(50) }
    sequence(:description) { |n| Faker::Lorem.paragraph(2) }
  end

  factory :photo do
    sequence(:image) { |n| File.open("./spec/support/photo#{n%12+1}.jpg") }
    sequence(:caption) { |n| "This is photo ##{n} in the list" }
    pet
  end

  factory :static_page do
    sequence(:title) { |n| Faker::Lorem.words(3).join(" ") }
    sequence(:subtitle) { |n| Faker::Lorem.words(6).join(" ") if n%2 == 0 }
    sequence(:content) { |n| Faker::Lorem.paragraph(3) }
  end
end
