class Photo < ActiveRecord::Base
  attr_accessible :caption, :image, :pet_id

  validates :pet_id, presence: true
end
