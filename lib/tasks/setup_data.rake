task :setup_data => :environment do
  20.times do
    post = Post.new
    post.user_id = User.all.pluck(:id).sample
    post.title = Faker::Company.catch_phrase
    post.description = Faker::Hipster.paragraphs(5).join(" ")
    post.is_published = [true,false].sample
    post.save
  end
end
