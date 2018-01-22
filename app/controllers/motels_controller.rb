class MotelsController < ApplicationController
  def index
    @motels = Rails.cache.fetch('motels')
    @bookings = Rails.cache.fetch('bookings')
  end

  def show
  end
end
