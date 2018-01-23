class Motel < ActiveResource::Base
  self.site = "https://luvotels-hiring-api.herokuapp.com"
  has_many :rooms
  has_many :bookings

  def self.set_all_models
    self.all_cached
    Room.all_cached
    Booking.all_cached
    return
  end

  def self.all_cached
    Rails.cache.fetch("motels") { Motel.all }
  end

  def self.find_cached(id)
    Rails.cache.fetch("motels").select {|motel| motel.id == id.to_i}.first
  end

  def number_bookings
    Rails.cache.fetch('bookings').select {|b| b.prefix_options.values[0] == self.id}.size
  end
end
