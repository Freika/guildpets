class UpdatePetsRatingJob < ActiveJob::Base
  queue_as :default

  def perform(guild_id)
    guild = Guild.find(guild_id)
    guild.rating = guild.get_rating
    guild.save!
  end
end
