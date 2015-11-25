class GetCharactersAndPetsJob < ActiveJob::Base
  queue_as :default

  def perform(guild)
    guild.rating = guild.create_characters
    guild.save!
  end
end
