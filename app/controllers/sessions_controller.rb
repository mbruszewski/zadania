class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to root_path
    end 
  end

  def create
    if !current_user
      user = User.find_by(login: params[:session][:login].downcase)
      if user & user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to zad2_path
      else
        flash.now[:error] = "Invalid login/passoword combination"
        render 'new'
      end
    else
     redirect_to root_path 
    end
  end

  def destroy
    if current_user
      session[:user_id] = nil
      redirect_to zad2_path
    else
      redirect_to root_path
    end
  end
end
