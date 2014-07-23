class PetsController < ApplicationController
  def index
    status = (params[:status] || 'owned').to_s
    if (status == 'owned') 
      @heading = "Our #{SiteSettings.breed.titlecase.pluralize}"
    else
      @heading = "#{status == 'available' ? 'Available' : 'Past'} #{SiteSettings.baby_species.titlecase.pluralize}"
    end
    @pets = Pet.where(status: status)
  end

  def new
  end

  def show
    @pet = Pet.find(params[:id])
  end
end
