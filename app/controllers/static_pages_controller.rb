class StaticPagesController < ApplicationController

  skip_before_filter :check_login, only: :home
  def home
  end

end
