# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, class_name: 'PostComment'

  validates :title, presence: true
  validates :body, length: { maximum: 500 }
end
