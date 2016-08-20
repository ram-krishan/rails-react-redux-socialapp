class ApplicationController < ActionController::Base
  include ActionController::Serialization

  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
end
