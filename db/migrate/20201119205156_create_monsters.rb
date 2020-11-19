class CreateMonsters < ActiveRecord::Migration[6.0]
  def change
    create_table :monsters do |t|
      t.string :name
      t.string :size
      t.string :mon_type
      t.string :alignment
      t.string :hit_dice
      t.string :languages
      t.string :damage_vulnerable, array: true, default: []
      t.string :damage_resist, array: true, default: []
      t.string :damage_immune, array: true, default: []
      t.string :condition_immune, array: true, default: []
      t.string :speed, array: true, default: []
      t.string :senses, array: true, default: []
      t.integer :armor_class
      t.integer :hit_points
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :challenge_rating
      t.integer :exp


      t.timestamps
    end
  end
end
