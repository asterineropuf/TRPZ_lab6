class CreateJoinTableDisabilityTypesPlaces < ActiveRecord::Migration[8.1]
  def change
    create_join_table :disability_types, :places do |t|
      # t.index [:disability_type_id, :place_id]
      # t.index [:place_id, :disability_type_id]
    end
  end
end
