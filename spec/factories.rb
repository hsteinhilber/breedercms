FactoryGirl.define do
  factory :pet do
    name       'Tapanga Mae Steinhilber'
    birth_date '2011-12-28'
    profile_picture File.open('./spec/support/Tapanga.jpg')
    gender     'F'
  end
end
