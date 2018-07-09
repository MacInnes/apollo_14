class CreateSpacemissionastronauts < ActiveRecord::Migration[5.1]
  def change
    create_table :spacemissionastronauts do |t|
      t.integer :astronaut_id
      t.integer :space_mission_id

      t.timestamps
    end
    # add_index :spacemissionastronauts, [:astronaut_id, :space_mission_id] <- this created a key that was longer than allowed
  end
end
