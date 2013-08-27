require "spec_helper"
require "jotform/report"

module JotForm
  describe User do
    let(:api) { API.new(ENV["JOTFORM_API_KEY"]) }

    context "#reports" do
      it "returns a list of reports for the active user" do
        VCR.use_cassette("user/reports") do
          reports = api.user.reports

          reports.should be_a(Array)
          reports.first.should be_a(Report)
        end
      end
    end

    context "#usage" do
      it "returns usage details for the active user" do
        VCR.use_cassette("user/usage") do
          usage = api.user.usage

          usage.should respond_to(:submissions)
          usage.should respond_to(:ssl_submissions)
          usage.should respond_to(:payments)
          usage.should respond_to(:uploads)
        end
      end
    end

    context "#active?" do
      it "returns true for an active user" do
        VCR.use_cassette("user/details") do
          api.user.active?.should be_true
        end
      end
    end
  end
end