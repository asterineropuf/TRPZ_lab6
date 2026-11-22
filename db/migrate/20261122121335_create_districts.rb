class CreateDistricts < ActiveRecord::Migration[8.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :route_safety_level

      t.timestamps
    end
  end
end
