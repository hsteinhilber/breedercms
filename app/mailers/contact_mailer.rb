class ContactMailer < ActionMailer::Base
  default to: SiteSettings.admin_email

  def contact_admin(params)
    #TODO: lookup the syntax for 'mail' and send a formatted email to the admin 
    mail
  end
end
