class CreateDisabilityTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :disability_types do |t|
      t.string :name
      t.string :icon_code

      t.timestamps
    end
  end
end
