class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      log_in(user)
      redirect_to delivery_path
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to store_index_path
  end
end
