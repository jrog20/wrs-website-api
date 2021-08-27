class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params)
    post.images.attach(params[:images])
    post.categories.push(params[:categories])
    post.tags.push(params[:tags])
    post.save
  end

  def update
    if post.update(post_params)
      render json: post
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    post.destroy
  end

  private
    def post_params
      params.permit(:title, :body, :date, :categories, :tags)
    end
end
