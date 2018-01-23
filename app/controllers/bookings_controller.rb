class BookingsController < ApplicationController
  def index
    # if params
    if params.include?(:motel_id)
      @bookings = Rails.cache.fetch('bookings').select {|b| b.prefix_options.values[0] == params[:motel_id].to_i}
    elsif params.include?(:room_id)
      @bookings = Rails.cache.fetch('bookings').select {|b| b.room_id == params[:room_id].to_i}
    else
      @bookings = Rails.cache.fetch('bookings').sort_by {|b| b.created_at}
    end
    @bookings.reverse!
  end

  # def show
  # end
end
