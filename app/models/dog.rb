# == Schema Information
#
# Table name: dogs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  birth_date :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dog < ActiveRecord::Base
  attr_accessible :birth_date, :name
end
