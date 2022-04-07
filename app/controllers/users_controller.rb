class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :edit, :create]
  before_action :correct_user, only: :edit

  def index
    @users = User.paginate(page: params[:page], per_page: 9).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
      redirect_to root_path
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated."
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new

    # get all the posts made by user sorted by created_at
    @posts = @user.posts.paginate(page: params[:page], per_page: 4).order(created_at: :desc)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    user = User.find(params[:id])
    if user != current_user
      flash[:danger] = "You are not authorized to edit this user."
      redirect_to root_path
    end
  end

end
