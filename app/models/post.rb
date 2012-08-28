class Post < ActiveRecord::Base

  attr_accessible :body, :excerpt, :title, 
    :author_id, :category_ids, :slug, :draft, :published_at

  validates_presence_of :title, :body, :author, :slug
  validates_associated :author
  validates_inclusion_of :draft, in: [true, false]
  
  before_validation :generate_slug

  has_many :comments, :dependent => :destroy
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_and_belongs_to_many :categories

  delegate :full_name, to: :author, prefix: true

  def self.published
    where("draft = ? AND published_at < ?", false, Time.current)
  end

  def self.search(terms)
    where("title LIKE :t OR body LIKE :t", t: "%#{terms}%")
  end

  def to_param
    "#{id}-#{slug}"
  end
  
  protected
  
  def generate_slug
    self.slug = title unless slug.present?
    self.slug = slug.parameterize
  end

end