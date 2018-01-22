class Motel < ActiveResource::Base
  self.site = "https://luvotels-hiring-api.herokuapp.com"
  has_many :rooms
  has_many :bookings

  def self.all_cached
    Rails.cache.fetch("motels") { Motel.all }
  end

  def self.find_cached(id)
    Rails.cache.fetch('motels').select {|motel| motel.id == id.to_i}.first
  end
end
