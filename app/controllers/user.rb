get '/users/:user_id' do
  user = User.find(params[:user_id])
  erb :profile_page, :locals => {:user => user}
end

get '/users/:user_id/comments' do
  user = User.find(params[:user_id])
  comment = Comment.where(:user_id => params[:user_id])
  erb :user_comment_page, :locals => {:user => user, :comment => comment}
end

get '/posts/:user_id' do
  user = User.find(params[:user_id])
  post = Post.where(:user_id => params[:user_id])
  erb :user_post_page, :locals => {:user => user, :post => post}
end
