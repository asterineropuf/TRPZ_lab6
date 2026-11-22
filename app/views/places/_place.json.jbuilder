json.extract! place, :id, :name, :category, :address, :latitude, :longitude, :has_ramp, :has_braille, :description, :created_at, :updated_at
json.url place_url(place, format: :json)
