class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => []

  def create

    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id

    @comment.save



  	redirect_to @post
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(params[:post_id])
  end
end
