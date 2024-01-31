class AddForeignKeysToPostComments < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :post_comments, :posts
    add_foreign_key :post_comments, :users
    add_index :post_comments, :post_id
    add_index :post_comments, :user_id
  end
end
