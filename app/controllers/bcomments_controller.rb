class BcommentsController < ApplicationController

  before_filter :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    bcomment = post.bcomments.build(params[:bcomment])
    bcomment.user_id = current_user.id
    bcomment.save

    redirect_to :back
  end

  def destroy
    bcomment = current_user.bcomments.find(params[:id])
    bcomment.destroy
    redirect_to post_path(params[:post_id])
  end
end
