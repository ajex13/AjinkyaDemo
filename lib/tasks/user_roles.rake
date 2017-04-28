desc "Create user roles and users"
task :user_roles => :environment do
  Role.create(name:"moderator")
  Role.create(name:"author")


  mod = User.create(email:"mod@example.com",password: "password")
  auth= User.create(email:"auth@example.com", password: "password")

  Permission.create(user_id:mod.id,role_id:Role.first.id)
  Permission.create(user_id:auth.id,role_id:Role.second.id)
end
