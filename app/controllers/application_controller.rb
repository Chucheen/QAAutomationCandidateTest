class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  before_filter :check_login


  private

  def check_login
    if (!Rails.env.test?)
      user = current_user

      if(user.nil?)
          render 'shared/_error_message', locals: {message: 'User not signed!'.html_safe, title:'Error'}
          return
      end
    end
  end
end
