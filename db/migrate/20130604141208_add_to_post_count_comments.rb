class AddToPostCountComments < ActiveRecord::Migration
  def up
    add_column :posts, :post_comments_count, :integer, :default => 0
    add_column :users, :post_comments_count, :integer, :default => 0
    add_column :users, :posts_count, :integer, :default => 0
  end

  def down
    remove_column :posts, :post_comments_count
    remove_column :users, :post_comments_count
    remove_column :users, :posts_count
  end
end
