require 'bcrypt'
class User < ActiveRecord::Base
  attr_accessor :password, :temp_password
  before_save :encrypt_password
  validates :password, confirmation: true, unless: Proc.new { |a| a.password.blank? }
  validates :password_confirmation, presence: true, unless: Proc.new { |a| a.password.blank? }
  validates_presence_of :email
  validates_presence_of :name
  validates_uniqueness_of :email

  has_many :authentication_tokens

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == ::BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = ::BCrypt::Engine.generate_salt
      self.password_hash = ::BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def set_temporary_password
  	self.temp_password = generate_password
  	self.password_salt = ::BCrypt::Engine.generate_salt
    self.password_hash = ::BCrypt::Engine.hash_secret(temp_password, password_salt)
    return temp_password
  end

  def generate_password
  	password_length = 7
    lower_alphabets = ("a".."z").to_a

    return Array.new(password_length){||lower_alphabets[rand(lower_alphabets.size)]}.join
  end

end
