 class CommentsController < ApplicationController
  
  def create
    # 1. Find the parent Post first
    @post = Post.find(params[:post_id])
    
    # 2. Build the comment specifically for this post
    # This automatically sets the post_id foreign key on the comment
    @comment = @post.comments.create(comment_params)
    
    # 3. Redirect back to the Post Show page
    redirect_to post_path(@post)
  end
 
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    
    redirect_to post_path(@post), status: :see_other
  end
 
  private
 
  # Strong Parameters: Allow only author_name and content
  def comment_params
    params.require(:comment).permit(:author_name, :content)
  end
end
 