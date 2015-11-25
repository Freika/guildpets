class AddRatingToGuild < ActiveRecord::Migration
  def change
    add_column :guilds, :rating, :text
  end
end
