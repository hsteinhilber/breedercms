class StaticPage < ActiveRecord::Base
  attr_accessible :content, :subtitle, :title
end
