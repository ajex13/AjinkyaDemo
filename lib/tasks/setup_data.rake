task :setup_data => :environment do
  25.times do
    post = Post.new
    post.user_id = User.all.pluck(:id).sample

    post.title = Faker::Company.catch_phrase
    post.description = Faker::Hipster.paragraphs(5).join(" ")

    post.save
  end
end
