class AnimationsController < ApplicationController
	
	before_action :set_animation, only: [:show, :edit, :update, :destroy]
	
	@days = ["Sun","Mon","Tue","Wed","Thu","Fri"]
	
	def index
		@animations = Animation.all
	end
	def show
	end
	def new
		@animation = Animation.new
	end
	def create
		@animation = Animation.new(animation_params)
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
			redirect_to animation_path
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
			params[:animation].permit(:title)
		end
		
		def set_animation
			@animation = Animation.find(params[:id])
		end
end
