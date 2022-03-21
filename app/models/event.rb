class Event < ApplicationRecord
    has_many :enrollments, dependent: :destroy
    has_many :users, through: :enrollments
    validates :name, presence: true
    belongs_to :category
    has_many :comments , as: :commentable
end
