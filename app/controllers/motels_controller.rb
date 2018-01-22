class MotelsController < ApplicationController
  def index
    @motels = Motel.all
    @bookings = @motels.map {|motel| motel.bookings }.flatten
    @revenue = @bookings.map(&:amount_centavos).inject(:+)
  end

  def show
  end
end
