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

get '/submit' do
  erb :submit_post
end

post '/submit_posts' do
  # p session[:user_id].inspect  
  post = Post.create(:title => params[:title], :url => params[:url], :user_id => session[:user_id])
  redirect to '/'
end

post '/postvote/:post_id' do
  pv = Postvote.find_by_user_id_and_post_id(session[:user_id], params[:post_id] )
  if session[:user_id] 
    if pv == nil
      new_pv = Postvote.create(:user_id => session[:user_id], 
                               :post_id => params[:post_id], 
                               :votes => 1)
      post_vote_return    
    else
      post_vote_return if pv.user_id == session[:user_id]
      pv[:votes] += 1
      p "nil two"
      post_vote_return
    end
  end
    post_vote_return
end

def post_vote_return
  post = Post.find_by_id(params[:post_id])
  return post.postvotes.count.to_s
end
