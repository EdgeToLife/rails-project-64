# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: :creator_id
  has_many :comments, class_name: 'PostComment'
  has_many :post_likes, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { maximum: 1000 }
end
