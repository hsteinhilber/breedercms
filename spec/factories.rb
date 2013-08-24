FactoryGirl.define do
  factory :pet do
    name       'Tapanga Mae Steinhilber'
    birth_date '2011-12-28'
    profile_picture File.open('./spec/support/Tapanga.jpg')
    gender     'F'
    color      'Silver'
    eye_color  'Brown'
    breed      'Siberian Husky'
    height     23
    weight     53.5
    description "A simple description of a beautiful dog"
  end

  factory :photo do
    sequence(:image) { |n| File.open("./spec/support/photo#{n}.jpg") }
    sequence(:caption) { |n| "This is photo ##{n} in the list" }
    pet
  end
end
