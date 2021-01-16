class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(name: params[:name], email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:requested_path] || tests_path
    else
      flash.now[:alert] = 'Подтвердите свою учетную запись, пожалуйста'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
    cookies.delete :requested_path
    cookies.delete :email
    cookies.delete :name
  end
end
