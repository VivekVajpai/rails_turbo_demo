class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts= Post.order(created_at: :desc)
  end

  def show
    if @post.is_viewed == false
      @post.update(is_viewed: true)
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save!
      @posts = Post.count
      respond_to do |format|
        format.turbo_stream
      end 
    end
  end

  def edit
    respond_to do |format|
      # format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@post), partial: "posts/form", locals: { post: @post }) }
      format.turbo_stream
      # format.html { render partial: "posts/form", locals: { post: @post } }
    end
  end

  def update
    @post.update(post_params)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @post.destroy
    @posts = Post.count
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
