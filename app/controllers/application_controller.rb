class ApplicationController < ActionController::API


#to set username 
	include DeviseTokenAuth::Concerns::SetUserByToken
		before_action :configure_permitted_parameters, if: :devise_controller?
	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username , :role])	
	end

	def authenticate_admin
		unless current_user.is_admin?
			render json: "You are not authorized to do this action", status: :bad_request   
		end
	end

	def authenticate_creator 
		render json: "You didn't have access to do this action" if current_user.email != @list.creator
	end
end
