class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
      user = User.find_by(email: params[:user][:email])
			if user && user.authenticate(params[:user][:password])
				session[:user_id] = user.id
				redirect_to gossips_path
			else
				flash.now[:danger] = 'Invalid email/password combination'
				render 'new'
			end
    end

    private
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end 

    def destroy
    end

end 
