class Photo < ActiveRecord::Base
  attr_accessible :caption, :image
  belongs_to :pet

  validates :pet_id, presence: true
end
