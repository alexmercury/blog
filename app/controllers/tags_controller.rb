class TagsController < ApplicationController

  def create
    #post = Post.find(params[:post_id])
    #post.united.tag =
    #post.united.id_posts =  params[:post_id]
    #tag = Tag.find_or_create_by_cont(params[:tag])
    #tag.save



    #united = United.new
    #united.id_posts =  params[:post_id]
    #united.id_tags =  tag.save

    redirect_to :back
  end

  def destroy

  end

  def new

  end

end
