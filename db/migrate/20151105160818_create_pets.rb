class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :creature_id
      t.string :family
      t.boolean :can_battle
      t.text :description
      t.text :source

      t.timestamps null: false
    end
  end
end
