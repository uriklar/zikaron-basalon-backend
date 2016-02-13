describe "CommunityLeaders API" do

  describe "POST /community_leaders" do
    it "creates a community leader" do
      community_leader_params = {
        community_leader: {
          email: "uriklar@gmail.com",
          cities: "Tel Aviv, Kfar Saba"  
        }
      }.to_json

      post "/community_leaders", community_leader_params, 
                     request_headers.merge({"Content-Type" => "application/json"})

      expect(response.status).to eq 201 # created
      cl = CommunityLeader.first
      expect(cl.email).to eq "uriklar@gmail.com"
      expect(cl.cities.length).to eq 2
    end
  end
  
end