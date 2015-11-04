class PostsController < ApplicationController
  before_action :find_post, only: [:show, :create, :destroy, :edit, :update]
  def index
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Right on!  Saved!"
    else
      render 'edit', notice: "DANG!  Try again!"
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Yeah!  That was a great BLOG that you posted!"
    else
      render 'new', notice: "If at first you don't succeed, try try again!"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
