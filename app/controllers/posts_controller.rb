class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    # Change from strong params to allow image
    # binding.pry
    # @post = Post.create(title: params[:title], body: params[:body], date: params[:date], tags: params[:tags], categories: params[:categories], images: params[:images])
    @post = Post.new(post_params)
    @post.images.attach(params[:images])
    @post.save
  end

  def destroy
    @post.destroy
  end

  private
    def post_params
      params.permit(:title, :body, :date, :categories, :tags)
    end
end
