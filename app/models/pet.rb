# == Schema Information
#
# Table name: pets
#
#  profile_pic     :text
#  id              :integer          primary key
#  name            :string(255)
#  birth_date      :date
#  created_at      :datetime
#  updated_at      :datetime
#  profile_picture :string(255)
#

class Pet < ActiveRecord::Base
  attr_accessible :birth_date, :name, :profile_picture

  mount_uploader :profile_picture, ImageUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :profile_picture, presence: true

  def age

  end
end
