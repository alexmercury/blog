ActiveAdmin.register User do

  filter :email

  index do
    column :email
    column :user_name
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs 'User Details' do
      f.input :user_name
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end

    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit user: [:email, :password, :password_confirmation, :user_name]
    end
  end

end