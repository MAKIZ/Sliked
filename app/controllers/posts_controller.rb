class PostsController < ApplicationController
  before_action :load_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(create_params)
    @post.user = current_user

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      redirect_back fallback_location: edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def create_params
    params.require(:post).permit(:name, :description, :photo)
  end

  def post_params
    params.require(:post).permit(:name, :description)
  end

  def load_post
    @post = current_user.posts.find(params[:id])
  end
end
