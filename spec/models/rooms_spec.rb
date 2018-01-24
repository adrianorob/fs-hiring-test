require 'active_resource/http_mock'
require "rails_helper"

RSpec.describe Room, :type => :model do
  context "testing Rooms" do
    it "caches all rooms" do
      rooms = Room.all_cached
      expect(Rails.cache.fetch('rooms')).to eq rooms
    end

    it "find a specific room" do
      room = Room.all_cached.last
      expect(room).to eq Room.find_cached(room.id)
    end

    it "a Room have name" do
      room = Room.all_cached.last
      expect(room).to respond_to :name
    end

    it "a Room have many bookings" do
      Booking.all_cached
      room = Room.all_cached.last
      expect(room.number_bookings).to be > 0
    end
  end
end
