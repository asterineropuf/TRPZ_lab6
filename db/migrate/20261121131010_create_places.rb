class CreatePlaces < ActiveRecord::Migration[8.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :category
      t.string :address
      t.float :latitude
      t.float :longitude
      t.boolean :has_ramp
      t.boolean :has_braille
      t.text :description

      t.timestamps
    end
  end
end
