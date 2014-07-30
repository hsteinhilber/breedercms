class ContactMailer < ActionMailer::Base
  default to: SiteSettings.feedback_email

  def feedback(params)
    @name = params[:name]
    @email = params[:email]
    @comments = params[:comment]
    @newsletter = params[:join_newsletter]
    mail(from: "#{@name} <#{@email}>",
         subject: "Feedback from #{@name}")
  end
end
