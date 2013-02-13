class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.author = Author.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to new_post_url
    else
      render action: "new"
    end
  end
end
