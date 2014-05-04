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

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, uniqueness: true

  def to_param
    slug
  end

  def self.find_by_param(input)
    input.to_s == input.to_i.to_s ? find_by_id(input) : find_by_slug(input)
  end

  def title=(v)
    self.slug = v.gsub(/\s*&\s*/, "-and-")
                 .gsub(/\s*@\s*/, "-at-")
                 .gsub(/[`']/, "")
                 .parameterize if self.new_record?
    super(v)
  end
end
