module Sevendigital

class ApiOperatorCached < ApiOperator

  def initialize(client, cache)
    @cache = cache
    super(client)
  end

  def call_api(api_request)
    uri = create_request_uri(api_request)
    api_response = @cache.get(uri.to_s)
    #puts "got from cache #{uri}" if api_response
    if (!api_response) then
      #puts "calling #{uri}"
      api_response = make_http_request_and_digest(uri)
      @cache.set(uri.to_s, api_response)
    end
    api_response
  end
end

end
