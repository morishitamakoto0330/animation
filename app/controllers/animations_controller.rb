require "date"

class AnimationsController < ApplicationController
	
	before_action :set_animation, only: [:show, :edit, :update, :destroy]
	
	def index
		@days = Day.all
		@animations = Animation.all
		@count = 0
		@animations.each do |animation|
			if animation.finished == 0 && animation.viewer == @current_user.name
				@count = @count + 1
			end
		end
	end
	def show
		@url = "http://himado.in?sort=&sortby=&page=0&cat=&click=1&keyword="+ @animation.title
	end
	def past_show
		@animations = Animation.all
		@ads = Ad.all
		@seasons = Season.all
		@count = 0
	end
	def new
		@animation = Animation.new
		@animation.ad = Date.today.year
		mon = Date.today.month
		if mon == 3 or mon == 4 or mon == 5
			@animation.season = "春"
		elsif mon == 6 or mon == 7 or mon == 8
			@animation.season = "夏"
		elsif mon == 9 or mon == 10 or mon == 11
			@animation.season = "秋"
		elsif mon == 12 or mon == 1 or mon == 2
			@animation.season = "冬"
		end
	end
	def create
		@animation = Animation.new(animation_params)
		@animation.viewer = @current_user.name
		if @animation.save
			redirect_to animations_path
		else
			render 'new'
		end
	end
	def edit
	end
	def update
		if @animation.update(animation_params)
			if @animation.finished
				redirect_to animations_path
			elsif
				redirect_to animation_path
			end
		else
			render 'edit'
		end
	end
	def destroy
		@animation.destroy
		redirect_to animations_path
	end
	private
	
		def animation_params
			params[:animation].permit(:title, :day, :ad, :season, :finished, :viewer)
		end
		
		def set_animation
			@animation = Animation.find(params[:id])
		end
end
