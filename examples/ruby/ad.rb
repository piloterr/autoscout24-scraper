# AutoScout24 Ad API – Ruby example (stdlib only)
# Usage: PILOTERR_API_KEY=your-key ruby ad.rb
require "json"
require "net/http"
require "uri"

uri = URI("https://api.piloterr.com/v2/autoscout24/ad")
uri.query = URI.encode_www_form('query' => 'https://www.autoscout24.fr/offres/porsche-macan-s-diesel-pano-1-hand-diesel-or-cat_ma57mo20311-547632b2-e4fc-47f3-8143-1a2d7b276366')

request = Net::HTTP::Get.new(uri)
request["x-api-key"] = ENV.fetch("PILOTERR_API_KEY")

response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, read_timeout: 60) do |http|
  http.request(request)
end

abort "Piloterr error #{response.code}: #{response.body}" unless response.is_a?(Net::HTTPSuccess)

puts JSON.pretty_generate(JSON.parse(response.body))
