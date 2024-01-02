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

3.times do |_index|
  User.create!(
    id: _index,
    email: "user#{_index}@example.com",
    password: 'secret',
  )
end

5.times do |_index|
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::ChuckNorris.fact,
    category_id: 1,
    user_id: 1
  )
end
