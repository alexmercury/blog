class TagsController < ApplicationController

  def create
  end

  def destroy
=begin
    tag = Tag.find(params[:id])
    uniteds = United.find_by_tag_id(params[:id])
    uniteds.each do |utd|
      utd.destroy
    end
    tag.destroy
=end
  end

  def new
  end

  def show
    @posts = Tag.find(params[:id]).posts
    respond_to do |format|
      format.html # show.html
    end
  end

end
