# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  has_many :comments, class_name: 'PostComment'
  has_many :likes, dependent: :destroy, class_name: 'PostLike'

  validates :title, presence: true
  validates :body, length: { minimum: 100, maximum: 1000 }
end
