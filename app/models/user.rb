class User < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :events, through: :enrollments
    validates :username, :email, presence: true ,uniqueness: true 
    before_save { self.email = email.downcase }
    has_secure_password
    has_one :address, dependent: :destroy
    accepts_nested_attributes_for :address, allow_destroy: true
end
