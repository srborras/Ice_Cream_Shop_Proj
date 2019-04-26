class HomeController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def home
  end

  def about
  end

  def privacy
  end

  def contact
  end
  
  private
  
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def correct_user
    redirect_to(root_url) unless @user == current_user
  end
  
end
