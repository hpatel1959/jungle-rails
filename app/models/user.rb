class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }

  def self.authenticate_with_credentials(email, password)
    no_space_lowercase_email = email.downcase.gsub(/\s+/, '')
    user = User.find_by_email(no_space_lowercase_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
