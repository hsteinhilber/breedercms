# == Schema Information
#
# Table name: litters
#
#  id         :integer          not null, primary key
#  birth_date :string(255)
#  mother_id  :integer
#  father_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Litter < ActiveRecord::Base
  attr_accessible :birth_date, :father_id, :mother_id
  belongs_to :mother, class_name: Pet
  belongs_to :father, class_name: Pet
  has_many :pets
  default_scope ->  { order('birth_date DESC') }

  validates :father_id, presence: true
  validates :mother_id, presence: true

  def males 
    @males || @males = self.pets.where("gender = 'M'").count
  end

  def females
    @females || @females = self.pets.where("gender = 'F'").count
  end
end
