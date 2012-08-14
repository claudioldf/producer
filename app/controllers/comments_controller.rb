class CommentsController < ApplicationController

  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    flash[:alert] = 'Fail to receive the comment. Double check the fields.' unless @comment.save

    redirect_to @post
  end

end
