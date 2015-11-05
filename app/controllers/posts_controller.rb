class PostsController < ApplicationController
  before_action :find_post, only: [:show, :destroy, :edit, :update]
  def index
    @posts = Post.all.order("created_at desc")
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Right on!  Saved!"
    else
      render 'edit', notice: "DANG!  Try again!"
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to @post, notice: "Yeah!  That was a great BLOG that you posted!"
    else
      render 'new', notice: "If at first you don't succeed, try try again!"
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
