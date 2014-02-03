class PetsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
