class Pet < ActiveRecord::Base
  has_and_belongs_to_many :characters
  validates :name, presence: true, uniqueness: true

  def get_all
    pets = HTTParty.get("https://eu.api.battle.net/wow/pet/?locale=ru_RU&apikey=#{ENV['bnet_api_key']}")
    pets['pets'].each do |pet|
      Pet.create!(name: pet['name'], creature_id: pet['creatureId'], \
        can_battle: pet['canBattle'], family: pet['family'])
    end
  end
end
