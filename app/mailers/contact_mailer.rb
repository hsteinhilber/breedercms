class ContactMailer < ActionMailer::Base
  default to: SiteSettings.admin_email

  def feedback(params)
    @name = params[:name]
    @email = params[:email]
    @comments = params[:comment]
    mail(from: "#{@name} <#{@email}>",
         subject: "Feedback from #{@name}")
  end
end
