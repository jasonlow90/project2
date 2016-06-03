class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to '/profiles'
        return
      else
        flash[:error] = "Incorrect password"
      end
    else
      flash[:error] = "No such email"
    end
    redirect_to root_path
    end



  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
