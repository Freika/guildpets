class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :guild_id

      t.timestamps null: false
    end
    add_index :characters, :guild_id
  end
end
