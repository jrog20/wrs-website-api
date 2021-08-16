class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @Post = Post.create(post_params)
  end

  def destroy
    @post.destroy
  end

  private
    def post_params
      params.permit(:title, :body, :date, images: [], tags: [], categories: [])
    end
end
