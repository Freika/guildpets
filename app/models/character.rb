class Character < ActiveRecord::Base
  has_and_belongs_to_many :pets
  belongs_to :guild

  after_save :get_pets

  def get_pets
    url = "https://eu.api.battle.net/wow/character/#{self.guild.realm}/#{self.name}?fields=pets&locale=ru_RU&apikey=#{ENV['bnet_api_key']}"
    uri = Addressable::URI.parse(url)
    character = HTTParty.get(uri.normalize)

    if character['pets'].present?
      pets = character['pets']['collected']
      pets.each do |pet|
        find_pet = Pet.find_by(name: pet['name'])
        self.pets << find_pet if find_pet
      end
    end
  end
end
