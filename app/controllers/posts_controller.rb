class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.create(post_params)
    # @post.images.attach(params[:images])
    # binding.pry
  end

  def destroy
    @post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :date, categories: [], tags: [], images: [{}])
    end
end
