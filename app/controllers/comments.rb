# Redirect to new answer form

get '/posts/:post_id/comments/new' do 
@post = Post.find(params[:post_id])
erb :"comment/new"
end

# Create new answer

post '/posts/:post_id/comments' do
	 #check who is  logged in at the moment
	@post = Post.find(params[:post_id])
	comment = @post.comments.create(post_id: params[:post_id], comment_body: params[:comment_body],user_id: current_user.id)
	
	redirect "/posts/#{@post.id}"
end

