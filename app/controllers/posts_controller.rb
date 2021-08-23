class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    # Change from strong params to allow image
    # @post = Post.create(post_params)
    @post = Post.create(title: params[:title], body: params[:body], date: params[:date], tags: params[:tags => []], categories: params[:categories => []], images: params[:images])
    # binding.pry
    # @post.images.attach(params[:images])
  end

  def destroy
    @post.destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :date, categories: [], tags: [], images: [{}])
    end
end
