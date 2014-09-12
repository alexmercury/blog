class PostsController < ApplicationController
 
 # before_filter :authenticate_user!, :except => [:show, :index]
 # before_filter :add_all_tag

  # GET /posts
  def index
    @posts = Post.index_posts.includes(:user).page(params[:page]).per(5)
    @html_title = 'All Posts'
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
    @post = Post.new
    @post.tags.build

    respond_to do |format|
      format.html # new.html
    end
  end

  # GET /posts/1/edit
  def edit
    @post = current_user.posts.find(params[:id])
    @post.tags.build
  end

  # POST /posts
  def create
    if current_user.posts.posts_not.length >= 3
      respond_to do |format|
        format.html { redirect_to panel_url, notice: 'You have '+current_user.posts.posts_not.length.to_s+' not accept post' }
      end
    else
      myParams = params[:post][:listTags]
      params[:post].delete(:listTags)
      @post = current_user.posts.new(params[:post], :as => :blog_user)

      respond_to do |format|
        if @post.save
          unless  myParams.nil?
            myParams.each do |key, value|# Параметры существующих тегов из формы
              unless value.to_i == 0
                United.create do |united|
                  united.post_id = @post.id
                  united.tag_id = key.to_s
                end
              end
            end
          end
          format.html { redirect_to @post, notice: 'Post was successfully created.' }
        else
           format.html { render action: 'new' }
        end
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
      if @post.update_attributes(params[:post], :as => :blog_user) &&  @post.update_attribute(:status, 0)

        unless  myParams.nil?
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
    post_tags = United.find_all_by_post_id(params[:id])
    unless post_tags.nil?
      post_tags.each do |united|
        united.destroy
      end
    end
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path }
    end
  end

 # User panel
  def panel
    @posts = current_user.posts
  end

 def ng_post
   sleep 10
   @posts = []
   i = 0
   20.times do
     i += 1
     @posts << { title: ('Long title long long long long lo long ' + i.to_s), image_url: view_context.image_path("rails_img/#{rand(1..13)}.png"), size: rand(100..250)}
   end

   render json: @posts
 end

  def ng_post_add

    p ('*')*20

    p params[:count]

    @posts = []
    i = 0
    20.times do
      i += 1
      @posts << { title: ('Long title long long long long lo long ' + i.to_s), image_url: view_context.image_path("rails_img/#{rand(1..13)}.png"), size: rand(100..250)}
    end

    render json: @posts
  end

  def add_all_tag
    @tags = Tag.all
  end

end
