class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    if !current_user
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create
    if !current_user
      @user = User.new(params[:user])
      if @user.save
        session[:user_id] = @user.id
        redirect_to @user, :notice => "Successfully created user."
      else
        render :action => 'new'
      end
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to @user, :notice  => "Successfully updated user."
      else
        render :action => 'edit'
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user.id == params[:id]
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, :notice => "Successfully destroyed user."
    else
      redirect_to root_path
    end
  end
end
