# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

5.times do |_index|
  Category.create!(
    name: Faker::Game.unique.genre
  )
end

# 3.times do |index|
#   User.create!(
#     id: index,
#     email: "user#{index}@example.com",
#     password: 'secret'
#   )
# end

# 5.times do |_index|
#   Post.create!(
#     title: Faker::ChuckNorris.fact,
#     body: Faker::Lorem.paragraphs(number: 10).join(' '),
#     category_id: 1,
#     user_id: 1
#   )
# end

# Post.all.each do |post|
#   rand(1..10).times do
#     post.comments.create!(
#       content: Faker::Lorem.sentence,
#       user_id: 1,
#       parent_id: nil
#     )
#   end
# end
