class UsersController < ApplicationController
before_action :load_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render(:new)
    end
  end

  def show
    if current_user == nil
      redirect_to login_path
    else
      if current_user.buildings != nil 
        @favorites = current_user.buildings 
      end
      if current_user.architects != nil 
        @favorite_architects = current_user.architects
      end
    end
  end

  def edit
    render(:edit)
  end

  def update
    @update_worked = @user.update(user_params)
    if @update_worked
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  def destroy
    if @user = current_user || current_user.is_admin?
      @user.destroy
      redirect_to root_path
    else
      render nothing: true, status: 401
    end
  end

private

  def load_user
    return @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end

