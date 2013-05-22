require 'faker'

30.times do
  User.create(:username => Faker::Name.name, :password => 12345)
end

30.times do
  Post.create(:title => Faker::Lorem.sentence, :url => Faker::Internet.url, :user_id => User.find(1 + rand(30)).id)
end


100.times do
  Comment.create(:body => Faker::Lorem.sentence, :user_id => User.find(1 + rand(30)).id, :post_id => Post.find(1 + rand(30)).id)
end
