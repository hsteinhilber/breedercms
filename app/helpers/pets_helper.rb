module PetsHelper
  def display_attribute(text, value, suffix = nil)
    if not value.nil?
      "<dt>#{text}</dt><dd>#{value}#{suffix}</dd>".html_safe
    end
  end

  def belongs_to_litter?(pet)
    not (pet.litter_id.nil? or pet.litter_id == 0)
  end
end
