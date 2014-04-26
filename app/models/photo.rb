# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  caption    :string(255)
#  pet_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ActiveRecord::Base
  attr_accessible :caption, :image
  belongs_to :pet
  before_destroy :remove_image_file

  mount_uploader :image, ImageUploader

  validates :pet_id, presence: true
  validates :image, presence: true

private
  def remove_image_file
    image.remove!
  end
end
