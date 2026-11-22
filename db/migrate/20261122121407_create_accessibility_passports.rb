class CreateAccessibilityPassports < ActiveRecord::Migration[8.1]
  def change
    create_table :accessibility_passports do |t|
      t.float :ramp_angle
      t.integer :door_width_cm
      t.boolean :has_elevator
      t.text :hazard_gutters_note
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
