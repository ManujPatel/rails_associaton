class Event < ApplicationRecord
    # frozen_string_literal: true
    has_many :enrollments, dependent: :destroy
    has_many :users, through: :enrollments
    validates :name, presence: true
    belongs_to :category
    has_many :comments , as: :commentable
end
