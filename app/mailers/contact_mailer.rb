class ContactMailer < ActionMailer::Base
  default to: SiteSettings.admin_email

  def contact_admin
    mail
  end
end
