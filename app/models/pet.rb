# == Schema Information
#
# Table name: pets
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  birth_date      :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  profile_picture :string(255)
#  gender          :string(255)
#  color           :string(255)
#  eye_color       :string(255)
#  breed           :string(255)
#  height          :float
#  weight          :float
#  description     :text
#

class Pet < ActiveRecord::Base
  attr_accessible :birth_date, :name, :profile_picture, :gender
  attr_accessible :color, :eye_color, :breed, :height, :weight
  attr_accessible :description
  has_many :photos, dependent: :destroy
  has_many :litters, dependent: :destroy, foreign_key: :mother_id
  before_destroy :remove_profile_picture

  mount_uploader :profile_picture, ImageUploader

  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :profile_picture, presence: true
  validates :gender, presence: true, inclusion: %w(M F)

  def age
    months = (Date.today.year * 12 + Date.today.month) - (birth_date.year * 12 + birth_date.month)
    years = Date.today.year - birth_date.year - (birthday_passed ? 0 : 1)
    years >= 2 ? "#{years} years" : "#{months} months"
  end

private
  def birthday_passed
    (Date.today.month > birth_date.month || 
      (Date.today.month == birth_date.month && Date.today.day > birth_date.day))
  end

  def remove_profile_picture
    profile_picture.remove!
  end
end
