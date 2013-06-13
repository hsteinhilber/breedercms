class PetsController < ApplicationController
  def new
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
