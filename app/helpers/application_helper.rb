module ApplicationHelper

  # Return the full title on a per-page basis
  def full_title(page_title)
    if page_title.empty? 
      SiteSettings.title
    else
      "#{SiteSettings.title} - #{page_title}"
    end
  end

  def static_pages
    StaticPage.where('NOT slug IN (?)', ['home', 'about-us'])
  end
end
