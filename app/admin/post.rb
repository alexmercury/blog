ActiveAdmin.register Post do

  scope 'Untested posts', :posts_not
  scope 'Proven posts', :index_posts

  filter :title

  index do
    column :id
    column :title
    column :created_at
    column :updated_at

    default_actions
  end

  form do |f|
    f.inputs 'Post' do
      f.input :title
      f.input :body
      f.input :user_id
      f.input :status
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit post: [:title, :body, :user_id, :status]
    end
  end

end