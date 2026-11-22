class DistrictsController < ApplicationController
  def index
    @districts = District.includes(:places).order(:name)
  end

  def show
    @district = District.find(params[:id])
    @places = @district.places.includes(:accessibility_passport, :disability_types).order(:name)
  end
end