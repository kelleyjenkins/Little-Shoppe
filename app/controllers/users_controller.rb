class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    user.roles << Role.find_by(title: "registered_user")
    flash[:notice] = "Logged in as #{user.first_name} #{user.last_name}"
    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end

  def edit
    @user = current_user
  end

  def update
    if current_store_admin? || current_store_manager?
      current_user.update(user_params)
      redirect_to admin_store_dashboard_index_path(current_user.store)
    elsif current_platform_admin?
      current_user.update(user_params)
      redirect_to admin_store_dashboard_index_path(current_user.store)
    elsif current_user != nil
      current_user.update(user_params)
      flash[:notice] = "Successfully updated your account information"
      redirect_to dashboard_index_path
    else
      render file: "/public/404"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :address, :address_2, :city, :state, :zip, :phone)
  end
end
