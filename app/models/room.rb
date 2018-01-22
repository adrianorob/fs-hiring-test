class Room < ActiveResource::Base
  # self.site = "http://someip.com/posts/:post_id/"
  # binding.pry
  self.site = "https://luvotels-hiring-api.herokuapp.com/motels/:motel_id/"
  self.element_name = 'rooms'

  belongs_to :motel
  has_many :bookings
  
  def self.all_cached
    motels = Rails.cache.fetch('motels')
    Rails.cache.fetch("rooms") { motels.map {|motel| motel.rooms }.flatten }
  end
end
