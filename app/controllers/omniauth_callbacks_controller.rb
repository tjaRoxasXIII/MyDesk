class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    before_action :authenticate_user!, except: :google

    def google_oauth2
        @user = User.google_omniauth(request.env['omniauth.auth'])
        sign_in_and_redirect @user
     end
    
end
