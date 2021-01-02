class ListsController < ApplicationController
before_action :set_list , only: [:show , :update , :destroy]	
before_action :authenticate_admin , only: [:create]
	def index
		lists = List.all
		render json: lists
	end
	def show
		render json: @list
	end
	def create
		list = List.new(list_params)
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
private
	def set_list
		@list = List.find_by(id: params[:id])
		render json: "Record not found" if @list.nil?
	end
	def list_params
		params.require(:list).permit(:title)
	end
end
