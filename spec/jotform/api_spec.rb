require "spec_helper"

module JotForm
  describe API do
    let(:api) { API.new(ENV["JOTFORM_API_KEY"]) }

    describe "limit-left handling" do
      it "should not initially know the limit value" do
        api.limit_left.should be_nil
      end

      it "should decrease limit_left for each request" do
        VCR.use_cassette("limit_left") do
          api.request("user", method: :get)
          limit_left = api.limit_left
          api.request("user", method: :get)
          api.limit_left.should eq limit_left - 1
        end
      end
    end

    context ".user" do
      it "should return a User instance" do
        api.user.should be_instance_of(User)
      end
    end
  end
end