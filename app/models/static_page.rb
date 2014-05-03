# == Schema Information
#
# Table name: static_pages
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  subtitle   :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class StaticPage < ActiveRecord::Base
  attr_accessible :content, :subtitle, :title
  attr_readonly :slug
end
