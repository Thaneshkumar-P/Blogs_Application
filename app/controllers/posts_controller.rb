class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_topic, only: %i[ edit ]
  protect_from_forgery except: :index

  # GET /posts or /posts.json
  def index
    if params[:topic_id].present?
      @topic = Topic.find(params[:topic_id])
      @posts = @topic.posts.includes([:user])
    else
      from = Time.now - (3600 * 24)
      to = Time.now
      unless params[:from_date].blank?
        from = params[:from_date]
      end
      unless params[:to_date].blank?
        to = params[:to_date]
      end

      @posts = Post.picker(from, to).includes([:topic, :user])
      @pagy, @posts = pagy(@posts)
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:id])
    @comment = Post.find(params[:id]).comments
    @tag = @post.tags
    @star = Star.new
    @user_comment_ratings = {}
    @all_comment_ratings = {}

    @comment.each do |comment|
      user_comment_rating = UserCommentRating.find_by(user: current_user, comment: comment)
      user_comment_rating ||= UserCommentRating.new(user: current_user, comment: comment)
      @comment_stars = Comment.find(comment.id).user_comment_ratings
      @comment_stars = @comment_stars.group(:rating).count
      @comments_stars = {
        5 => @comment_stars[5] || 0,
        4 => @comment_stars[4] || 0,
        3 => @comment_stars[3] || 0,
        2 => @comment_stars[2] || 0,
        1 => @comment_stars[1] || 0
      }
      @all_comment_ratings[comment.id] = @comments_stars
      @user_comment_ratings[comment.id] = user_comment_rating
    end

    @stars = @post.stars
    @stars = @stars.group(:star).count
    @star_ratings = {
      5 => @stars[5] || 0,
      4 => @stars[4] || 0,
      3 => @stars[3] || 0,
      2 => @stars[2] || 0,
      1 => @stars[1] || 0
    }
  end

  # GET /posts/new
  def new
    @post = Post.new
    @topic = Topic.find(params[:topic_id])
    # @tag = @post.tags.build
  end

  def read
    @post = Post.find(params[:id])

    if current_user.posts.include?(@post)
      @status = 'read'
    else
      @status = 'unread'
    end

    if @status == 'unread'
      current_user.posts << @post
    end
  end
  # GET /posts/1/edit
  def edit
    # @topic = Topic.find(params[:topic_id])
    # @post = @topic.posts.find(params[:id])
    # @tag = @post.tags.build
    authorize! :edit, @post
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.new(post_params)
    @post.user_id = current_user.id
    @post.topic_id = params[:topic_id]
    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      if @post.save
        format.js { render 'posts/create' }
      else
        format.js { render 'posts/create' }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    @topic = Topic.find(params[:topic_id])
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_post_url(@topic, @post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post = Post.find(params[:id])

    authorize! :destroy, @post

    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :post_image, tag_ids: [], tags_attributes: [:id, :name]).tap do |whitelisted|
        whitelisted[:tag_ids] = Tag.where(id: whitelisted[:tag_ids]).pluck(:id)
      end
    end

    def star_params
      params.require(:star).permit(:star)
    end
end
