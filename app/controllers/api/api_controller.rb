module Api
  class ApiController < ApplicationController #inherit so we get everything else
    protect_from_forgery with: :null_session
    before_action :authenticate!

    private

      def authenticate!
        authenticate_or_request_with_http_basic("Please authenticate to use the API.") do |email, password|
          user = User.find_by(email: email)
          return true if user && user.authenticate(password) 

          head :unauthorized
        end
      end
  end
end
