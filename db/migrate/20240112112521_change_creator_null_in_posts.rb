class ChangeCreatorNullInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :creator, :integer, null: true
  end
end
