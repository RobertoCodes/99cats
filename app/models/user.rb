require 'bcrypt'

class User < ActiveRecord::Base
  validates :user_name, uniqueness: true
  before_validation :ensure_session_token

  attr_reader :password



  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def is_password?(password)
    password_digest.is_password?(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end


  has_many(
    :cats,
    class_name: "Cat",
    foreign_key: :user_id
  )

end
