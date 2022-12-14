class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      my_posts = Post.where(user_id: current_user.id)
      @posts = my_posts.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @posts = Post.all.where(user_id: current_user.id)
    end
    @markers = @posts.geocoded.map do |post|
      {
        lat: post.latitude,
        lng: post.longitude,
        info_window: render_to_string(partial: "info_window", locals: {post: post})
      }
    end
  end

  def show
  end

  def new
    @post = Post.new
    @trip = Trip.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, status: :see_other
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:date, :trip_id, :entry, :address, :highlight, :travel_tips, :cover_photo, photos: [])
  end

  def trip_params
    params.require(:trip).permit(:name, :photo)
  end
end
