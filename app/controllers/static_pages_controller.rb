class StaticPagesController < ApplicationController
  def contact
  end

  def send_contact
    ContactMailer.feedback(params).deliver
    flash[:success] = "Your message has been sent."
    redirect_to contact_path
  end

  def show
    @static_page = StaticPage.find(params[:id])
  end
end
