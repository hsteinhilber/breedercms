# == Schema Information
#
# Table name: admins
#
#  id               :integer          not null, primary key
#  username         :string(255)
#  email            :string(255)
#  crypted_password :string(255)
#  password_salt    :string(255)
#  password_token   :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Admin < ActiveRecord::Base
  attr_accessible :crypted_password, :email, :password_salt, :password_token, :username
end
