class LoginsController < ApplicationController
  
  def new
    
  end

  def create
    marketer = Marketer.find_by(email: params[:email])
    if marketer && marketer.authenticate(params[:password])
      session[:marketer_id] = marketer.id
      flash[:success] = "You are logged in"
      redirect_to ideas_path
    else
      flash.now[:danger] = "Your email address or password does not match"
      render 'new'
    end
  end

  def destroy
    session[:marketer_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end