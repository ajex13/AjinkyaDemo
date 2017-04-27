task :setup_user_data => :environment do
  25.times do
    user = User.new
    user.email = Faker::Internet.safe_email
    user.password = "password"
    user.save
  end
end
