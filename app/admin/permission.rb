ActiveAdmin.register Permission do
    menu label: "Modify permissions", priority: 2, parent: "Manage Users", parent_priority: 1

    scope :all, default: true
     scope("Moderator") { |scope| scope.where(role_id: 1) }
     scope("Author") { |scope| scope.where(role_id: 2) }

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
