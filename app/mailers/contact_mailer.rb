class ContactMailer < ActionMailer::Base
  default from: SiteSettings.admin_email
end
