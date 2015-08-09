class PagesController < ApplicationController
 
  def home
    redirect_to ideas_path if logged_in?
  end
  
end