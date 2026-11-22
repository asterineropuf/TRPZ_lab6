class PlacesController < ApplicationController
  before_action :set_place, only: %i[show edit update destroy]

  def index
    @districts = District.order(:name)
    @places = Place.includes(:district, :accessibility_passport, :disability_types).order(:name)

    if params[:district_id].present?
      @places = @places.where(district_id: params[:district_id])
    end

    if params[:q].present?
      query = "%#{params[:q].strip.downcase}%"
      @places = @places.where("LOWER(places.name) LIKE ? OR LOWER(places.address) LIKE ?", query, query)
    end
  end

  def accessible
    @districts = District.order(:name)
    @places = Place.includes(:district, :accessibility_passport, :disability_types)
                   .where(has_ramp: true, has_braille: true)
                   .order(:name)
    @filter_title = "Повністю безбар'єрні об'єкти (пандус + шрифт Брайля)"
    render :index
  end

  def show
  end

  def new
    @place = Place.new
    @place.build_accessibility_passport
  end

  def edit
    @place.build_accessibility_passport if @place.accessibility_passport.nil?
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: "Локацію «#{@place.name}» успішно додано до бази доступності."
    else
      @place.build_accessibility_passport if @place.accessibility_passport.nil?
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @place.update(place_params)
      redirect_to @place, notice: "Дані локації «#{@place.name}» оновлено."
    else
      @place.build_accessibility_passport if @place.accessibility_passport.nil?
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place.destroy!
    redirect_to places_path, status: :see_other, notice: "Локацію видалено з реєстру."
  end

  private

  def set_place
    @place = Place.includes(:district, :accessibility_passport, :disability_types).find(params[:id])
  end

  def place_params
    params.require(:place).permit(
      :name, :category, :address, :latitude, :longitude,
      :has_ramp, :has_braille, :description, :district_id,
      disability_type_ids: [],
      accessibility_passport_attributes: [
        :id, :ramp_angle, :door_width_cm, :has_elevator, :hazard_gutters_note, :_destroy
      ]
    )
  end
end