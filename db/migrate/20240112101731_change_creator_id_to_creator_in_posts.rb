class ChangeCreatorIdToCreatorInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :creator_id, :creator
  end
end
