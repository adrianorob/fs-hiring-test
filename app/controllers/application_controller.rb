class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  Motel.set_all_models
end
