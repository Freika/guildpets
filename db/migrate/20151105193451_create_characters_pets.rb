class CreateCharactersPets < ActiveRecord::Migration
  def change
    create_table :characters_pets, id: false do |t|
      t.integer :character_id, index: true
      t.integer :pet_id, index: true
    end
  end
end
