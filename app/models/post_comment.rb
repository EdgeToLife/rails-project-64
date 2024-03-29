# frozen_string_literal: true

class PostComment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true
  has_ancestry orphan_strategy: :restrict
end
