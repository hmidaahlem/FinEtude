class ApplicationController < ActionController::Base
    

  protect_from_forgery prepend: true

  skip_before_action :verify_authenticity_token, raise: false 
end
