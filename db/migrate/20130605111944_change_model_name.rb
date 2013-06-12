class ChangeModelName < ActiveRecord::Migration
  def up
    create_table "PostComments", :force => true do |t|
      t.integer  "post_id"
      t.text     "text"
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
      t.integer  "user_id"
    end
  end

  def down
    drop_table :bcomments
  end
end
