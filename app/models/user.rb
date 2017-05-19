class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  has_secure_password

  has_many :races
  has_many :tweets

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    unless @user.nil?
      return @user if @user.authenticate(password)
    end
    nil
  end
end
