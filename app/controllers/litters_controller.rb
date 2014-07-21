class LittersController < ApplicationController
  def show
    @litter = Litter.find(params[:id])
  end
end
