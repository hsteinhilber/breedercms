module PetsHelper
  def display_attribute(text, value, suffix = nil)
    if not value.nil?
      "<dt>#{text}</dt><dd>#{value}#{suffix}</dd>".html_safe
    end
  end
end
