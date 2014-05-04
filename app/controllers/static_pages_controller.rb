class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def show
    @static_page = StaticPage.find(params[:id])
  end
end
