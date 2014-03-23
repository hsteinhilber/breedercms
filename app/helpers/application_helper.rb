module ApplicationHelper

  # Return the full title on a per-page basis
  def full_title(page_title)
    if page_title.empty? 
      SiteSettings.title
    else
      "#{SiteSettings.title} - #{page_title}"
    end
  end
end
