ActiveAdmin.register Post do

  scope 'Untested posts', :posts_not
  scope 'Proven posts', :index_posts

  index do
    column :id
    column :title
    column :created_at
    column :updated_at

    default_actions

  end


end