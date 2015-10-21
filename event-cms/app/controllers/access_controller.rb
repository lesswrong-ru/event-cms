class AccessController < ApplicationController

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
  end

  def login
  end

  def attempt_login
    if params[:login].present? && params[:password].present?
	  found_user = User.where(:login => params[:login]).first
	  if found_user
	    authorized_user = found_user.authenticate(params[:password])
	  end
	end
	if authorized_user
	  session[:user_id] = authorized_user.id
	  session[:login] = authorized_user.login
	  flash[:notice] = "You are now logged in."
	  redirect_to(:action => 'index')
	else
	  flash[:notice] = "Invalid name/pass."
	  redirect_to(:action => 'login')
	end
  end

  def logout
	session[:user_id] = nil
	session[:login] = nil 
    flash[:notice] = "Logged out."
	redirect_to(:action => 'login')
  end
  
end
