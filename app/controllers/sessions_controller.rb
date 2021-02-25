class SessionsController < ApplicationController

    def omniauth
        user = User.create_from_omniauth(auth)
        end

        if user.valid?
            session[:user_id] = user.id
            # redirect_to new_apartments_path 
        else
            flash[:message] = user.errors.full_messages.join("")
            # redirect_to apartments_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end


