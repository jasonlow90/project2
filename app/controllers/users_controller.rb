class UsersController < ApplicationController

  # Index page '/'
  def home
  end

  def edit

  end

  def new

  end

  def create
    @user = User.new(user_params)

    # @user.name = params[:user][:name]
    # @user.email = params[:user][:email]
    # @user.password = params[:user][:password]
    # @user.password = params[:user][:password_confirmation]
    # @user.profile_pic = params[:user][:profile_pic]
    # @permitted = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    if @user.save
      redirect_to '/'
    else
      flash[:errors] = { :class => 'holy_crap_error', :message => @user.errors.full_messages }
      redirect_to '/sign_up'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def show

  end

  def update

  end

  def destroy

  end


end
