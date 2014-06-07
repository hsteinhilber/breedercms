class StaticPagesController < ApplicationController
  def contact
  end

  def send_email
    ContactMailer.contact_admin(params)
    flash[:success] = "Your message has been sent."
    redirect 'contact'
  end

  def show
    @static_page = StaticPage.find(params[:id])
  end
end
