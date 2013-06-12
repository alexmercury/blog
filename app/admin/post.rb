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

  form do |f|
    f.inputs 'Post' do
      f.input :status
      f.input :adm_comment
    end
    f.actions
  end
end