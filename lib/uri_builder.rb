class UriBuilder
  ENDPOINT = "https://www.google.co.jp/search?safe=off&q=site:"
  def initialize(domain)
    @domain = domain
  end

  def create_uri(path="")
    "#{ENDPOINT}#{@domain}#{path}"
  end
end

