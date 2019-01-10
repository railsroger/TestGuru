class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      store_location ||= root_path
      session[:user_id] = user.id
      redirect_to store_location || root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  def store_location
    cookies[:current_url] = request.original_url if request.get?
  end
end
