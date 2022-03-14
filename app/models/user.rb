class User < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :events, through: :enrollments
    validates :username, :email, presence: true ,uniqueness: true 
    before_save { self.email = email.downcase }
    has_secure_password
end
