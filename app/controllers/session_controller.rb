class SessionController < ApplicationController
	
	skip_before_action :user_logged_in?
	
	def index
		@user = User.new
  end
	
	def create
		@user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
		if @user
			reset_user_session
			session[:user] = @user.id
			if @user.name == "admin"
				redirect_to params[:referer].present? ? params[:referer] : users_path
			else
				redirect_to params[:referer].present? ? params[:referer] : animations_path
			end
		else
			@user = User.new
			flash.now[:referer] = params[:referer]
			flash.now[:error] = true
			render :index
		end
	end
	
	def delete
		reset_user_session
		redirect_to session_index_url
	end
	private
		def user_params
			params.require(:user).permit(:name, :password)
		end
end
