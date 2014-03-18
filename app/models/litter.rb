class Litter < ActiveRecord::Base
  attr_accessible :birth_date, :father_id, :mother_id
  belongs_to :father, class_name: Pet
  belongs_to :mother, class_name: Pet

  validates :father_id, presence: true
  validates :mother_id, presence: true
end
