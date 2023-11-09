class UserCommentRatingsController < ApplicationController
  before_action :set_user_comment_rating, only: %i[ show edit update destroy ]

  # GET /user_comment_ratings or /user_comment_ratings.json
  def index
    @comment = Comment.find(params[:comment_id])
    @user_comment_ratings = @comment.user_comment_ratings
  end

  # GET /user_comment_ratings/1 or /user_comment_ratings/1.json
  def show
  end

  # GET /user_comment_ratings/new
  def new
    @user_comment_rating = UserCommentRating.new
  end

  # GET /user_comment_ratings/1/edit
  def edit
  end

  # POST /user_comment_ratings or /user_comment_ratings.json
  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @user_comment_rating = UserCommentRating.new(user_comment_rating_params)
    @user_comment_rating.user = current_user
    @user_comment_rating.comment = Comment.find(params[:comment_id])

    respond_to do |format|
      if @user_comment_rating.save
        format.html { redirect_to topic_post_url(@topic, @post) }
        format.json { render :show, status: :created, location: @user_comment_rating }
      else
        format.html { redirect_to topic_post_url(@topic, @post) }
        format.json { render json: @user_comment_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_comment_ratings/1 or /user_comment_ratings/1.json
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @user_comment_rating.update(user_comment_rating_params)
        format.html { redirect_to topic_post_url(@topic, @post) }
        format.json { render :show, status: :ok, location: @user_comment_rating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_comment_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_comment_ratings/1 or /user_comment_ratings/1.json
  def destroy
    @user_comment_rating.destroy

    respond_to do |format|
      format.html { redirect_to user_comment_ratings_url, notice: "User comment rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_comment_rating
      @user_comment_rating = UserCommentRating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_comment_rating_params
      params.require(:user_comment_rating).permit(:rating)
    end
end
