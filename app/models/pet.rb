# == Schema Information
#
# Table name: pets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pet < ActiveRecord::Base
  attr_accessible :birth_date, :name

  validates :name, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
end
