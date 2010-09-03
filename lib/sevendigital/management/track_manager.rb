module Sevendigital

  class TrackManager < Manager

    def get_details(id)
      api_request = Sevendigital::ApiRequest.new("track/details", {:trackId => id})
      api_response = @api_client.operator.call_api(api_request)
      @api_client.track_digestor.from_xml(api_response.content.track)
    end

    def get_chart(options={})
      api_request = Sevendigital::ApiRequest.new("track/chart", {}, options)
      api_response = @api_client.operator.call_api(api_request)
      @api_client.chart_item_digestor.list_from_xml(api_response.content.chart)
    end

  end
end