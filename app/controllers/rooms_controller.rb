class RoomsController < ApplicationController
  def index
    @motel = Motel.find_cached(params[:motel_id])
    @rooms = @motel.rooms
  end

  def show
  end
end
