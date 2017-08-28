class SessionsController < ApplicationController

  skip_before_filter :check_login, only: :create

  def new
  end

  def create
    @user = Customer.find_by_email(params[:email])
    if !@user
      flash[:error]='Wrong username and password combination'
      redirect_to root_path and return
    end
    if(@user.authenticate(params[:password]))
      create_remember_token_and_signin(params[:remember_me] == "1")
      redirect_to root_path and return
    end
    flash[:error] = "Wrong username and password combination"
    redirect_to root_path
  end

  def destroy
    signout
    redirect_to root_path
  end

  private
  def create_remember_token_and_signin(permanent)
    remember_token = SecureRandom.urlsafe_base64
    if(!@user.update_attribute('remember_digest', remember_token))
      flash[:error] =  @user.errors.full_messages
      return

    end
    if permanent
      sign_in_permanent @user
    else
      sign_in @user
    end
  end
end
