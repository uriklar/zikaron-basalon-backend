module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def request_headers(auth_token = nil)
    	headers = { 
        "Accept" => "application/json",
      }

      headers["Authorization"] = auth_token if auth_token
      headers
    end
  end
end