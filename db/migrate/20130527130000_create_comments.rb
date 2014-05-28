class CreateComments < ActiveRecord::Migration
  def change
    create_table :post_comments do |t|
      t.integer :post_id
      t.text :text
      t.integer :user_id

      t.timestamps
    end
    
  end
end
