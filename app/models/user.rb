class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  has_many :posts, foreign_key: "author_id"

  validates_presence_of :email, :first_name, :last_name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :allow_blank => true

  def full_name
    "#{first_name} #{last_name}".titleize
  end

end