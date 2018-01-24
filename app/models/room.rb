class Room < ActiveResource::Base
  self.site = "https://luvotels-hiring-api.herokuapp.com/motels/:motel_id/"
  self.element_name = 'rooms'
  belongs_to :motel
  has_many :bookings

  def self.all_cached
    Rails.cache.fetch("rooms") { Motel.all_cached.map {|motel| motel.rooms }.flatten }
  end

  def self.find_cached(id)
    Rails.cache.fetch("rooms").select {|room| room.id == id.to_i}.first
  end

  def number_bookings
    Rails.cache.fetch('bookings').select {|b| b.room_id == self.id}.size
  end
end
