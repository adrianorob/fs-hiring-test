class MotelsController < ApplicationController
  def index
    @motels = Motel.all_cached
    @bookings = Booking.all_cached
    # binding.pry
  end

  def show
  end
end
