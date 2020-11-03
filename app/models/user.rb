class User < ApplicationRecord

  validates_presence_of :website_url
  validates :website_url, format: URI::regexp(%w[http https])
  validates_uniqueness_of :url_slug
  validates_length_of :website_url, within: 3..255, on: :create, message: "too long"
  validates_length_of :url_slug, within: 3..255, on: :create, message: "too long"

  before_save :gethtml
  before_validation :generate_slug
  
  def generate_slug
    self.url_slug = SecureRandom.uuid[0..5] if self.url_slug.nil? || self.url_slug.empty?
    true
  end
   

   def gethtml
   	data = WebsiteCrawler.new(self.website_url).fetch
   	binding.pry
   end
end



