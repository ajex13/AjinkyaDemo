ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Info" do
          para "Welcome to HashBlog Admin Panel!"
        end
      end
      column do
        panel "Recent Posts by our users" do
          ul do
            Post.order("created_at desc").limit(5).map do |post|
              li link_to( post.title , admin_post_path(post))
                para "by #{post.user.email}"
            end
          end
        end
      end
      column do
        panel "Top contributors" do
          ul do
            User.order("users.posts_count DESC").limit(10).map do |user|
              li link_to( user.email , admin_user_path(user))
            end
          end
        end
      end
    end
  end # content
end
