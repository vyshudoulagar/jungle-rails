class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
    else
        flash[:alert] = 'Invalid email or password'
        redirect_to :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully'
  end
end
