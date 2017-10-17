class User < ApplicationRecord
  before_validation :downcase_email

  has_many :races, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :hashtags, through: :races

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  has_secure_password

  def self.authenticate(email, password)
    @user = User.find_by_email(email)
    unless @user.nil?
      return @user if @user.authenticate(password)
    end
    nil
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
