class ApplicationController < ActionController::Base
    
    private

    def require_login
        redirect_to '/users/sign_in' unless !current_user.nil?
    end

end
