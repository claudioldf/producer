class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, 
    :remember_me, :first_name, :last_name

  has_many :posts, foreign_key: "author_id"
  validates_presence_of :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end