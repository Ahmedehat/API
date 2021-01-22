class Card < ApplicationRecord
belongs_to :creator , class_name: "User" , foreign_key: "user_id"
has_many :comments , dependent: :destroy
belongs_to :list
end
