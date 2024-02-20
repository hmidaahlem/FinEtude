module SessionsHelper
    def current_user
        @current_user ||= Person.find_by(id: session[:user_id]) if session[:user_id]
      end
end
