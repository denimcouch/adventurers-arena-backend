class CreateEncounterMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_monsters do |t|
      t.integer :encounter_id
      t.integer :monster_id
      t.timestamps
    end
  end
end
