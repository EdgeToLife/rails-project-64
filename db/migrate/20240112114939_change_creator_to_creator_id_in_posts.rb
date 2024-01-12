class ChangeCreatorToCreatorIdInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :creator, :creator_id
  end
end
