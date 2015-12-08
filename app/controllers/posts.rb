# Display new post form

get '/posts/new' do
	erb :"post/new"
end

# Create new post

post '/posts' do
	@user = User.find(session[:user_id])
	
	post = @user.posts.create(post_title: params[:post_title], post_body: params[:post_body])
	
	 redirect "/posts/#{post.id}"
end

# Display post edit form

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
erb :'post/edit'
end

# Update post

patch '/posts/:id' do
	@post = Post.find(params[:id])
	
	@post.update(post_title: params[:post_title], post_body: params[:post_body])
	redirect "/posts/#{@post.id}"
end

# Delete post

delete '/posts/:id' do
	@post = Post.find(params[:id])
	@post.destroy
	redirect '/posts'
end

# View all posts of user

get '/posts/:id' do
	# byebug
	@post = Post.find(params[:id])
	# @user = @post.user
	erb :"post/show"
end

get '/posts' do
	@posts = Post.all
	@user = User.find(session[:user_id])
	erb :"post/index"
end


