class Guild < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  validates :name, presence: true
  validates :realm, presence: true

  serialize :rating, Array

  def from_api
    url = "https://eu.api.battle.net/wow/guild/#{self.realm}/#{self.name}?&locale=ru_RU&apikey=#{ENV['bnet_api_key']}"
    uri = Addressable::URI.parse(url)
    guild = HTTParty.get(uri.normalize)
  end

  def create_characters
    url = "https://eu.api.battle.net/wow/guild/#{self.realm}/#{self.name}?fields=members&locale=ru_RU&apikey=#{ENV['bnet_api_key']}"
    uri = Addressable::URI.parse(url)
    characters = HTTParty.get(uri.normalize)

    characters['members'].each do |char|
      self.characters.build(name: char['character']['name'])
    end
    save!
  end

  def get_rating
    rating = []
    Pet.find_each do |pet|
      n = 0
      characters.each do |char|
        n += 1 if char.pets.include?(pet)
      end
      rating << {pet.name => n}
    end
    rating
  end
end
