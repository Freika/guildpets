class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name
      t.string :realm

      t.timestamps null: false
    end
  end
end
