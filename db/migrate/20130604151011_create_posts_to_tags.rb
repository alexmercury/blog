class CreatePostsToTags < ActiveRecord::Migration
  def change
    create_table :uniteds do |t|
      t.integer :post_id
      t.integer :tag_id
    end
  end
end
