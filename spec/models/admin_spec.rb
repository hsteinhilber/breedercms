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

require 'spec_helper'

describe Admin do
  pending "add some examples to (or delete) #{__FILE__}"
end
