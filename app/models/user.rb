# frozen_string_literal: true

class User < ActiveRecord::Base
  #to make admin and user
	enum role: [:user, :admin]
	after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  def is_admin?
    self.role == "admin"
  end

  def user_to_admin
    self.update(role: "admin")
  end

end
