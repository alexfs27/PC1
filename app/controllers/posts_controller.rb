class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_blog
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_to do !format!
    format.html
  end
end


  # GET /posts/new
  def new
     @post = @blog.post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
   @post = @blog.post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to blog_post_path(@blog,@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: blog_post_path(@blog,@post) }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to blog_posts_path(@blog,@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: blog_post_path(@blog,@post) }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_post_path(@blog), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_blog
    @blog = Blog.find(params[:blog_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :blog_id)
    end
end
