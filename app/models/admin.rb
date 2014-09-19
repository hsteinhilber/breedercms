# == Schema Information
#
# Table name: admins
#
#  id                  :integer          not null, primary key
#  login               :string(255)
#  email               :string(255)
#  crypted_password    :string(255)      not null
#  password_salt       :string(255)      not null
#  persistence_token   :string(255)      not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  single_access_token :string(255)      default(""), not null
#  perishable_token    :string(255)      default(""), not null
#  login_count         :integer          default(0), not null
#  failed_login_count  :integer          default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#

class Admin < ActiveRecord::Base
  attr_accessible login, email, password, password_confirmation
  acts_as_authentic
end
