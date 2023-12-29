class AddAncestryToPostComment < ActiveRecord::Migration[7.1]
  def change
    change_table(:post_comments) do |t|
      # postgres
      t.string "ancestry", collation: nil, null: false
      t.index "ancestry"
    end
  end
end
