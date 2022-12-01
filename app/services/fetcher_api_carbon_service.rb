require 'open-uri'
require 'net/http'
require 'json'

class FetcherApiCarbonService
  def initialize(url)
    @url = url
  end

  def call
    uri = URI("https://api.websitecarbon.com/site?url=#{@url}")

    https = Net::HTTP.get(uri)
    json = JSON.parse(https)
    return json
  end
end
