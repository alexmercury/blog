class Col < ActiveRecord::Migration
  def up
    remove_column :users, :comments_count
    remove_column :posts, :comments_count

    add_column :users, :bcomments_count, :integer, :default => 0
    add_column :posts, :bcomments_count, :integer, :default => 0
  end

  def down
    remove_column :users, :bcomments_count
    remove_column :posts, :bcomments_count

    add_column :users, :comments_count, :integer, :default => 0
    add_column :posts, :comments_count, :integer, :default => 0
  end
end
