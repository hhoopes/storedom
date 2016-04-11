module Api 
  class ApiController < ApplicationController #inherit so we get everything else

    protect_from_forgery with: :null_session
  end
end
