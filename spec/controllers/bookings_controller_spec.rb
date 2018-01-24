require 'active_resource/http_mock'
require "rails_helper"

RSpec.describe BookingsController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @bookings" do
      get :index
      expect(assigns(:bookings).class).to eq(Array)
    end
  end
end
