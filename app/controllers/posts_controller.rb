class PostsController < ApplicationController
 
 before_filter :authenticate_user!, :except => [:show, :index]
 before_filter :add_all_tag

  # GET /posts
  def index
    @posts = Post.index_posts.includes(:user).page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html
    end
  end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  def new
    if current_user.posts.posts_not.length >= 3
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'You have 3 not accept post' }
        end
    else
      @post = Post.new
      @post.tags.build
      @tags = Tag.all

      respond_to do |format|
        format.html # new.html
      end
    end
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find(params[:id])
    @post.tags.build
  end

  # POST /posts
  def create
    myParams = params[:post][:listTags]
    params[:post].delete(:listTags)
    @post = current_user.posts.new(params[:post])

    respond_to do |format|
      if @post.save
        myParams.each do |key, value|# Параметры существующих тегов из формы
          unless value.to_i == 0
            United.create do |united|
              united.post_id = @post.id
              united.tag_id = key.to_s
            end
          end
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
      else
         format.html { render action: 'new' }
      end
    end
  end

  # PUT /posts/1
  def update
    myParams = params[:post][:listTags]
    params[:post].delete(:listTags)
    @post = current_user.posts.find(params[:id])
    post_tags = United.find_all_by_post_id(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])

        myParams.each do |key, value|# Параметры существующих тегов из формы
          unless value.to_i == 0
            United.create do |utd|
              utd.post_id = @post.id
              utd.tag_id = key
            end
          else
            unless post_tags.nil?
              post_tags.each do |utd|
                if key.to_i == utd.tag_id
                  utd.destroy
                end
              end
            end
          end
        end

        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

 # User panel
  def panel
    @posts = current_user.posts
  end

  def add_all_tag
    @tags = Tag.all
  end

end
