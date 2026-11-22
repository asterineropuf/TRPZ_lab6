class AddDistrictToPlaces < ActiveRecord::Migration[8.1]
  def change
    add_reference :places, :district, null: true, foreign_key: true
  end
endrails db:migrate