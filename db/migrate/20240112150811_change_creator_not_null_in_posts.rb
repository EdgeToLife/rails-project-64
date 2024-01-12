class ChangeCreatorNotNullInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :creator_id, :integer, null: false
  end
end
