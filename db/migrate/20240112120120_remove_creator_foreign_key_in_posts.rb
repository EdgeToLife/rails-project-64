class RemoveCreatorForeignKeyInPosts < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :posts, :users, column: :creator_id
  end
end
