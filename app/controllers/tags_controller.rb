class TagsController < ApplicationController

   def show
    @posts = Tag.find(params[:id]).posts
    respond_to do |format|
      format.html # show.html
    end
  end

end
