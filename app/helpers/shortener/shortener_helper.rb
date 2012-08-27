module Shortener::ShortenerHelper

  # generate a url from a url string
  def short_url(url, owner=nil)
    short_url = Shortener::ShortenedUrl.generate(url, owner)
    short_url ? url_for(:controller => :"shortener/shortened_urls", :action => :show, :id => short_url.unique_key, :only_path => false) : url
  end

  # Get the full URL from a short URL
  def full_url(short_url)
    begin
      short_url = Shortener::ShortenedUrl.where(unique_key: short_url[-5..-1]).first
    rescue Mongoid::Errors::DocumentNotFound => e
      nil
    end
    return short_url.nil? ? nil : short_url.url
  end

end
