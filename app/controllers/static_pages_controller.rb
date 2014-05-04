class StaticPagesController < ApplicationController
  def contact
  end

  def show
    @static_page = StaticPage.find(params[:id])
  end
end
