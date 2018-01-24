require 'active_resource/http_mock'
require "rails_helper"

RSpec.describe Booking, :type => :model do
  context "testing Bookings" do
    it "caches all bookings" do
      bookings = Booking.all_cached
      expect(Rails.cache.fetch('bookings')).to eq bookings
    end

    it "find a specific booking" do
      booking = Booking.all_cached.last
      expect(booking).to eq Booking.find_cached(booking.id)
    end

    it "a Booking belongs to a room" do
      booking = Booking.all_cached.last
      expect(booking).to respond_to :room_id
    end

    it "a Booking belongs to a motel" do
      booking = Booking.all_cached.last
      expect(booking.prefix_options.keys).to contain_exactly(:motel_id)
    end
  end
end
