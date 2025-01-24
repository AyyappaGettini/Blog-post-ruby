class BlogPostsController<ApplicationController

  before_action :authenticate_user!, except: [:show,:index]
  before_action :set_blog_post, only: [:show,:edit,:update,:destory]

  def index
    @blog_posts=user_signed_in? ? BlogPost.sorted : BlogPost.published.sorted
    @pagy, @blog_posts=pagy(@blog_posts)
    rescue Pagy::OverflowError
      redirect_to root_path(page: 1)
      # params[:page]=1
      # retry
  end

  def show
    @blog_post=BlogPost.find(params[:id])
  end

  def new
    @blog_post=BlogPost.new
  end

  def create
    @blog_post=BlogPost.new(blog_posts_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    if @blog_post.update(blog_posts_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destory
    @blog_post.destroy
    redirect_to root_path
  end

  def set_blog_post
    @blog_post=user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  # def authendicate_user!
  #       redirect_to new_user_session_path, alert: "you must sigined in or sign up to continue" unless user_signed_in?
  # end

  private
  def blog_posts_params
    params.require(:blog_post).permit(:title,:content,:cover_image,:published_at)
  end

end