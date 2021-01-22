class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    users = User.all
    render json: users
  end
  def find
    if params[:email].present?
      user = User.find_by(email: params[:email])
      if user.present?
        render json: user
      else
        render json: "Invalid  email"
      end
     else
      render json: "Email is missing", status: :bad_request
    end
  end

  def assign_admin
    if params[:email].present?
      user = User.find_by(email: params[:email])
      if user.present?
        user.user_to_admin  
        render json: "#{user.email} is admin"
      else
       render json: "Invalid  email"
      end
    else
      render json: "Email is missing", status: :bad_request
    end
  end
end
