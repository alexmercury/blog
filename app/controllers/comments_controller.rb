class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => [:create]

  def create

    post = Post.find(params[:post_id])
    comment = post.comments.build(params[:comment])
    if user_signed_in?
      comment.user_id = current_user.id
    else
      comment.user_id = 0
    end
    comment.save

  	redirect_to post
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy

    redirect_to post_path(params[:post_id])
  end
end
