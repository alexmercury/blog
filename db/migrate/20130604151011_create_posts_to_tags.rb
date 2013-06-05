class CreatePostsToTags < ActiveRecord::Migration
  def change
    create_table :uniteds do |t|
      t.integer :id_posts
      t.integer :id_tags

      t.timestamps
    end
  end
end
