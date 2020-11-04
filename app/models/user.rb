class User < ApplicationRecord

  validates_presence_of :website_url
  validates :website_url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :url_slug
  validates_length_of :website_url, within: 3..255, on: :create, message: "too long"
  validates_length_of :url_slug, within: 3..255, on: :create, message: "too long"

  before_save :gethtml
  before_validation :generate_slug

  scope :search ,    ->(topic){ where('headings LIKE ?', "%#{topic}%") }
  scope :notCurrent, ->(ids){ where(['id NOT IN (?)', ids]) if ids.any?}

  has_friendship
  
  def generate_slug
    self.url_slug = SecureRandom.uuid[0..5] if self.url_slug.nil? || self.url_slug.empty?
    true
  end
   

   def gethtml
   	self.headings = WebsiteCrawler.new(self.website_url).fetch
   end

   def short
    Rails.application.routes.url_helpers.short_url(url_slug: self.url_slug)
  end


  # def self.search(topic)
  #   where('headings LIKE ?', "%#{topic}%")
  # end

end



