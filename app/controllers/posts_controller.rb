class PostsController < ApplicationController
  before_action :current_user

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
    @post.user_id = params["user_id"]
  end

  def create
    @post = Post.new
    @post.user_id = current_user.id
    @post["title"] = params["post"]["title"]
    @post["description"] = params["post"]["description"]
    @post["posted_on"] = params["post"]["posted_on"]
    @post["place_id"] = params["post"]["place_id"]
    @post["user_id"] = params["post"]["user_id"]
    @post.save
    redirect_to "/places/#{@post["place_id"]}"
  end

  def show
    if @current_user
      @post = @current_user.posts.find_by(id: params[:id])
      if @post
        render "/places/show"
      else
        flash[:notice] = "No posts were found, feel free to add one."
        redirect_to "/places/#{params[:place_id]}"
      end
    else
      flash[:notice] = "Please log in to view posts."
      redirect_to "/login"
    end
  end

  # def post_params
  #   params.require(:post).permit(:title, :description, :posted_on, :place_id)
  # end

end
