class UserAddId < ActiveRecord::Migration
  def up
    add_column :posts, :user_id , :integer
    add_column :post_comments, :user_id , :integer
  end

  def down
    remove_column :posts, :user_id
    remove_column :post_comments, :user_id
  end
end
