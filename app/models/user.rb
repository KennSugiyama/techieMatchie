class User < ActiveRecord::Base
  validates_presence_of :username, :hash_password
  validates_uniqueness_of  :username

include BCrypt

  def password
    @password ||= Password.new(hash_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hash_password = @password
  end

  def self.authenticate(username, password_string)
    @user = User.find_by(username: username)
    if @user && @user.password == password_string
      @user
    end
  end
end

