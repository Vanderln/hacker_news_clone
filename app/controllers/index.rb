get '/' do
  @post = Post.order("title")
  erb :index
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:user_id] = nil
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
