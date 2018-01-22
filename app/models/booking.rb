class Booking < ActiveResource::Base
  self.site = "https://luvotels-hiring-api.herokuapp.com/motels/:motel_id/"
  belongs_to :motel
  belongs_to :room

  # class << self
  def self.all_cached
    motels = Rails.cache.fetch('motels')
    Rails.cache.fetch("bookings") { motels.map {|motel| motel.bookings }.flatten }
  end
  # end
end
