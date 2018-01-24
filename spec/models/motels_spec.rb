require 'active_resource/http_mock'
require "rails_helper"

RSpec.describe Motel, :type => :model do
  context "testing motels" do
    it "Motel cache be empty when not cached yet" do
      Rails.cache.clear
      expect(Rails.cache.fetch('motels')).to eq nil
    end

    it "Motel caching cache all motels" do
      Motel.all_cached
      expect(Rails.cache.fetch('motels')).to eq Motel.all
    end
    it "Motel.all gives an ActiveResource::Collection" do
      expect(Motel.all.class).to eq ActiveResource::Collection
    end

    it "Motel.first respond with Motel class" do
      expect(Motel.first.class).to eq Motel
    end

    it "a Motel have name" do
      motel = Motel.all_cached.last
      expect(motel).to respond_to :name
    end

    it "first Motel has at least one room" do
      expect(Motel.first.rooms.size).to be > 0
    end
  end
end
