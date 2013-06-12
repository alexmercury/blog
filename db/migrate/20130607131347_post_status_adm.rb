class PostStatusAdm < ActiveRecord::Migration
  def up
    add_column :posts, :status, :integer, :default => 0
    add_column :posts, :adm_comment, :text
  end

  def down
    remove_column :posts, :status
    remove_column :posts, :adm_comment
  end
end
