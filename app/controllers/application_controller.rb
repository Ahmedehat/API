class ApplicationController < ActionController::API
	before_action :authenticate_user , only: [:authenticate_admin]
#to set username and role
	include DeviseTokenAuth::Concerns::SetUserByToken
		before_action :configure_permitted_parameters, if: :devise_controller?
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username , :role])	
	end
	def authenticate_admin
		unless current_user.is_admin?
			render json: "You Must Be Admin", status: :bad_request   
		end
	end
	def authenticate_creator 
		render json: "You Must Be The Creator" if current_user != @list.creator
	end
	def authenticate_ud_cards
		render json: "You can't edit or del" unless  current_user == @list.creator or @card.creator
	end
end
