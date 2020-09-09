class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash.notice = "Post Created!"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash.notice = "Post Updated!"
    else
      render 'edit'
    end
  end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      flash.notice = "Post destroyed"
      redirect_to root_path
    end

  private

  def post_params
    params.require(:post).permit(:secret)
  end
end
