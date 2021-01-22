class ListsController < ApplicationController
before_action :set_list , only: [:show , :update , :destroy]	
before_action :authenticate_admin , only: [:create,:show ,:assign_members ,:unassign_members]
before_action :authenticate_creator , only: [:update , :destroy]
	def index
		if current_user.is_admin?
			lists = List.all
			render json: lists
		else
			render json: "refer to your admin"
		end
	end
	def show
			render json: @list
	end
	def create
		list = List.new(list_params)
		list.creator = current_user
		if list.save
			render json: list
		else
			render json: list.errors	
		end
	end
	def update
		if @list.update(list_params)	
			render json: list_params
		else
			render list.errors
		end
	end
	def destroy
		@list.destroy
		render json: @list
	end
	def assign_members
		user_id = params[:users_lists][:user_id]
		list_id = params[:users_lists][:list_id]
		if user_id.present? and list_id.present?
			user = User.find_by(id: user_id)
			list = List.find_by(id: list_id)
			if user.present? and list.present?
				userslist = UsersList.create(user_id: user_id, list_id: list_id)
				if userslist.save
					render json: userslist
				else
					render json: "dublicate data"
				end
			else
				render json: "User/List not found"
			end
		else
			render json: "invalid Entry"
		end 
	end
	def unassign_members
		user_id = params[:users_lists][:user_id]
		list_id = params[:users_lists][:list_id]
		if user_id.present? and list_id.present?
			user = User.find_by(id: user_id)
			list = List.find_by(id: list_id)
			if user.present? and list.present?
				UsersList.find_by(user_id: user_id, list_id: list_id).destroy
					render json: "Your action done"
			else
				render json: "User/List not found"
			end
		else
			render json: "invalid Entry"
		end 
	end
private
	def set_list
		@list = List.find_by(id: params[:id])
		render json: "Record not found" if @list.nil?
	end
	def list_params
		params.require(:list).permit(:title)
	end
end

