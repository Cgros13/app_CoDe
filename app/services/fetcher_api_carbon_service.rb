require 'open-uri'
require 'net/http'
require 'json'

class FetcherApiCarbonService
  def initialize(url)
    @url = CGI.escape(url)
  end

  def call
    begin
      doc = URI.open("https://api.websitecarbon.com/site?url=#{@url}").read
      json = JSON.parse(doc)
      return json
    rescue OpenURI::HTTPError => e
      return { error: "This website is not valid" }
    end
  end
end
