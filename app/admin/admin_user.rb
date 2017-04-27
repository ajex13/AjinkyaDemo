ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
  show do |user|
      attributes_table do
        #We want to keep the existing columns
        User.column_names.each do |column|
          row column
        end
        #This is where we add a new column
        row :login_as do
          link_to "#{user.name}", login_as_admin_user_path(user), :target => '_blank'
        end
      end
    end
  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
