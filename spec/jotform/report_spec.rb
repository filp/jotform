require "spec_helper"

module JotForm
  describe Report do
    let(:api) { API.new(ENV["JOTFORM_API_KEY"]) }

    context "helper methods" do
      specify do
        VCR.use_cassette("user/reports") do
          (api.user.reports.first).should respond_to(:protected?)
        end
      end
    end
  end
end