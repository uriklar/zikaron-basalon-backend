describe "Hosts API" do
  describe "GET /hosts" do
    it "returns all the hosts" do
      FactoryGirl.create :host, address: "Shpinoza 11, Tel Aviv"
      FactoryGirl.create :host, address: "Katzanelson 96, Givaataym"

      get "/hosts", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      hosts = body["hosts"]
      host_addresses = hosts.map { |h| h["address"] }

      expect(host_addresses).to match_array(["Shpinoza 11, Tel Aviv",
                                           "Katzanelson 96, Givaataym"])
    end
  end
end