class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @pagy, @records = pagy(Post.all)
    @top_posts = Post.limit(5)
    @categories = Category.all.filter { |category| category.posts.count != 0 }
    @tags = Tag.all.filter { |tag| tag.posts.count != 0 }
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    tm_post_params = params[:post]
    tag_names = tm_post_params[:tag_names]
    category_name = tm_post_params[:category_name]
    tm_post_params.delete(:tag_names)
    tm_post_params.delete(:category_name)

    @post = Post.new(post_params)

    if category_name.to_s.present?
      category = Category.find_by_name(category_name.to_s)
      category = Category.create!(name: category_name.to_s) if category.nil?
      @post.category = category
    end

    if tag_names.to_s.present?
      tag_names = tag_names.to_s.split(",")
      tag_names.each do |tag_name|
        tag = Tag.find_by_name(tag_name)
        tag = Tag.create!(name: tag_name) if tag.nil?
        @post.tags << tag
      end
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content, :created_at, :category_name, :tag_names)
  end
end
