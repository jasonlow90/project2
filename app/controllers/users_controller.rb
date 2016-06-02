class UsersController < ApplicationController

  # Index page '/'


  def new

  end

  def create
    @user = User.new(user_params)
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



end
