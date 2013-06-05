class CreatePostsToTags < ActiveRecord::Migration
  def change
    create_table :posts_to_tags do |t|
      t.integer :id_post
      t.integer :id_tag

      t.timestamps
    end
  end
end
