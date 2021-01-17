class List < ApplicationRecord
belongs_to :creator , class_name: "User" , foreign_key: "user_id"
has_many :cards , dependent: :destroy
end




