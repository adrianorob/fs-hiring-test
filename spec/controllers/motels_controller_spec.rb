require 'active_resource/http_mock'
require "rails_helper"

RSpec.describe MotelsController do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns @motels" do
      motel = Motel.all
      get :index
      expect(assigns(:motels)).to eq(motel)
    end
  end
end
