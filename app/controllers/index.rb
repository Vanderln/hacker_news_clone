get '/' do
  @post = Post.order("title")
  erb :index
end

get '/users/:user_id' do
  user = User.find(params[:user_id])
  erb :profile_page, :locals => {:user => user}
end

get '/posts/:user_id' do
  user = User.find(params[:user_id])
  post = Post.where(:user_id => params[:user_id])
  erb :user_post_page, :locals => {:user => user, :post => post}
end

get '/users/:user_id/comments' do
  user = User.find(params[:user_id])
  comment = Comment.where(:user_id => params[:user_id])
  erb :user_comment_page, :locals => {:user => user, :comment => comment}
end

get '/comments/:post_id' do
  comment = Comment.where(:post_id => params[:post_id]).order("created_at DESC")
  post = Post.find(params[:post_id])
  erb :post_comment_page, :locals => {:comment => comment, :post => post}
end

post '/comments/:post_id' do
  post = Post.find(params[:post_id])
  new_comment = Comment.create(:user_id => session[:user_id], :body => params[:comment], :post_id => params[:post_id])
  redirect to "/comments/#{params[:post_id]}"
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

get '/submit' do
  erb :submit_post
end

post '/submit_posts' do
  # p session[:user_id].inspect  
  post = Post.create(:title => params[:title], :url => params[:url], :user_id => session[:user_id])
  redirect to '/'
end

post '/' do 
  user = User.find_by_username(params[:name])
  if user
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect to '/'
    else
      erb :login
    end
  else
    user = User.create(:username => params[:name], :password => params[:password])
    session[:user_id] = user.id
    redirect to '/'
  end
  
  # redirect to '/users/:user_id'
end
