class RenameBcommentToPostComment < ActiveRecord::Migration
  def up
    rename_column :posts, :bcomments_count, :post_comments_count
    rename_table :bcomments, :post_comments

  end

  def down
    rename_column :posts, :post_comments_count, :bcomments_count
    rename_table :post_comments, :bcomments
  end
end
