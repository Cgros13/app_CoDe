require 'open-uri'
require 'net/http'
require 'json'

class FetcherApiCarbonService
  def initialize(url)
    @url = CGI.escape(url)
  end

  def call
    time = Time.now.to_i
    # uri = URI("https://api.websitecarbon.com/site?url=#{@url}")
    ap @url
    doc = URI.open("https://api.websitecarbon.com/site?url=#{@url}")

    json = JSON.parse(doc)

    ap "call api pour #{@url} terminé"
    ap "temps d'execution: #{Time.now.to_i - time} secondes"
    return json
  end
end
