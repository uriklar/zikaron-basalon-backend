describe "Hosts API" do
  describe "GET /hosts" do
    it "returns all the hosts" do
      FactoryGirl.create :host, address: "Shpinoza 11, Tel Aviv"
      FactoryGirl.create :host, address: "Katzanelson 96, Givaataym"

      get "/hosts", {}, request_headers

      expect(response).to be_success
      hosts = json["hosts"]
      host_addresses = hosts.map { |h| h["address"] }
      expect(host_addresses).to match_array(["Shpinoza 11, Tel Aviv",
                                           "Katzanelson 96, Givaataym"])
    end
  end

  describe "GET /hosts/:id" do
    it "fails if current user is not requested user" do
      h = FactoryGirl.create :host, address: "Shpinoza 11, Tel Aviv"
      h2 = FactoryGirl.create :host, address: "Katzanelson 96, Givaataym"

      get "/hosts/#{h.id}", {}, request_headers(h2.user.access_token)

      expect(response.status).to eq 401
    end

    it "returns host if current user is an admin" do
      h = FactoryGirl.create :host, address: "Shpinoza 11, Tel Aviv"
      admin = FactoryGirl.create :user, admin: true

      get "/hosts/#{h.id}", {}, request_headers(admin.access_token)

      expect(response).to be_success
      expect(json["host"]["address"]).to eq("Shpinoza 11, Tel Aviv")
    end

    it "returns host if current user is requested user" do
      h = FactoryGirl.create :host, address: "Shpinoza 11, Tel Aviv"

      get "/hosts/#{h.id}", {}, request_headers(h.user.access_token)

      expect(response).to be_success
      expect(json["host"]["address"]).to eq("Shpinoza 11, Tel Aviv")
    end
  end

  describe "POST /hosts" do
    it "creates a host" do
      host_params = {
        host: {
          address: "Shpinoza 11, Tel Aviv",
          user_attributes: {
            email: "uriklar@gmail.com",
            password: "supersecret",
            password_confirmation: "supersecret",
            first_name: "Uri"
          }
        }
      }.to_json

      post "/hosts", host_params, 
                     request_headers.merge({"Content-Type" => "application/json"})

      expect(response.status).to eq 201 # created
      h = Host.first
      expect(h.address).to eq "Shpinoza 11, Tel Aviv"
      expect(h.user.access_token).to be
    end
  end
  
end