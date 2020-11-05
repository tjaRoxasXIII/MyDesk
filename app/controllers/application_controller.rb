class ApplicationController < ActionController::Base
    # before_action :require_login
    private

    def require_login
        # binding.pry
        redirect_to '/users/sign_in' unless !current_user.nil?
    end
end
