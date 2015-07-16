class User < ActiveRecord::Base
  validates :email, :session_token, :password_digest, presence: true
  validates :email, uniqueness: true

  after_initialize :ensure_session_token
  
  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
