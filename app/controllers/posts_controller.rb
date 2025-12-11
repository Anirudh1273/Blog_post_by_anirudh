class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
 
  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)
 
    if @post.save
      # SUCCESS: This line redirects to app/views/posts/show.html.erb
      redirect_to @post, notice: 'Post was successfully created.'
    else
      # FAILURE: Stays on the new page so you can fix errors
      render :new, status: :unprocessable_entity
    end
  end
 
  # ... add edit, update, destroy actions here as needed ...
 
  private
 
  # Strong Parameters (Security)
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

 