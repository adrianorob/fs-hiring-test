class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  Motel.all_cached
  Room.all_cached
  Booking.all_cached
end
