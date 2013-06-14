class PostCommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post_comment = post.post_comments.build(params[:post_comment])
    post_comment.user_id = current_user.id
    post_comment.save

    redirect_to :back
  end

  def destroy
    post_comment = current_user.post_comments.find(params[:id])
    post_comment.destroy
    redirect_to post_path(params[:post_id])
  end
end
