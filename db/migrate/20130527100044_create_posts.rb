class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.integer :post_comments_count, :default => 0
      t.integer :status, :default => 0
      t.text :status_description

      t.timestamps
    end  
    
  end
end
