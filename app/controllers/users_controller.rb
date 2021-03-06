class UsersController < ApplicationController
  # filters
  # skip_before_action :check_login?, only: [:login]
  
  def list_users
    @users = User.all
  end

  def my_new_template
    
  end

  def login
  end

  def get_login
    # render plain: params.inspect
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user] = user.id
      UserMailer.login_email(user).deliver_now
      redirect_to root_path
    else
      render :login
    end
  end

  def logout
    session.destroy
    redirect_to root_path
  end
  
  

  def display_other_template
    # @users = User.all
    # render 'extras/display_render_template'
    # render action: :list_users
    # render :list_users
    # redirect_to action: :list_users, layout: false
    redirect_to controller: :products, action: :new
  end

  def new_user
    @user = User.new
  end

  def create_user
    # render plain: params[:user]
    @user = User.new(user_params)
    @user.name = @user.full_name
    if @user.save
      redirect_to action: :list_users
      UserMailer.login_email(@user).deliver_now
    else 
      redirect_to action: :new_user  
    end
  end

  def show
    @user = User.find params[:id]
    render 'user_show_template'
  end
  

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :age, :gender, :point, :city_id, :email)
  end
  
  
end
