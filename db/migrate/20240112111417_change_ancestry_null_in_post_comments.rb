class ChangeAncestryNullInPostComments < ActiveRecord::Migration[7.1]
  def change
    change_column :post_comments, :ancestry, :string, null: true
  end
end
