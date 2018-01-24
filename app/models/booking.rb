class Booking < ActiveResource::Base
  self.site = "https://luvotels-hiring-api.herokuapp.com/motels/:motel_id/"
  # belongs_to :motel
  belongs_to :room

  def self.all_cached
    motels = Rails.cache.fetch('motels')
    Rails.cache.fetch("bookings") { Rails.cache.fetch('motels').map {|motel| motel.bookings }.flatten }
  end

  def motel
    Motel.find_cached(self.prefix_options[:motel_id])
  end

  def room
    Room.find_cached(self.room_id)
  end

  def self.find_cached(id)
    Rails.cache.fetch("bookings").select {|booking| booking.id == id.to_i}.first
  end

  def revenue_discount
    self.amount_centavos * (self.fee_percentage.fdiv(100))
  end
end
