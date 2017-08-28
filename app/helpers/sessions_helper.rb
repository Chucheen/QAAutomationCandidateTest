module SessionsHelper

  def getFullTitle(page_title)
    title = "Homie Test"
    title = page_title.empty? ? title : "#{title} | #{page_title}"
  end

  def sign_in(customer)
    cookies[:remember_token] = customer.remember_digest
    self.current_user = customer
  end

  def sign_in_permanent (customer)
    cookies.permanent[:remember_token] = customer.remember_digest
    self.current_user = customer
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    return nil if !cookies[:remember_token]
    @current_user ||= Customer.find_by_remember_digest(cookies[:remember_token])
  end

  def signout
    cookies.delete(:remember_token)
    self.current_user = nil
  end

end