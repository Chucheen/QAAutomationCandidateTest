class Customer < ActiveRecord::Base
    has_many :orders, class_name: 'Order', foreign_key: 'Customer_id'

    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    validates :firstname, :lastname, presence: true
    validates :password_confirmation, :presence =>true
    has_secure_password

    def remember
        self.remember_token = Customer.new_token
        update_attribute(:remember_digest, Customer.digest(remember_token))
    end

    def Customer.new_token
        SecureRandom.urlsafe_base64
    end

    def current_order
        orders.where(closed: false).first
    end
end
