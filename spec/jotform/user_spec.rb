require "spec_helper"
require "jotform/report"

module JotForm
  describe User do
    let(:user) { API.new(ENV["JOTFORM_API_KEY"]).user }

    subject { user }
    
    describe "user properties" do

      it { should respond_to(:username) }
      it { should respond_to(:name) }
      it { should respond_to(:email) }
      it { should respond_to(:website) }
      it { should respond_to(:time_zone) }
      it { should respond_to(:account_type) }
      it { should respond_to(:status) }
      it { should respond_to(:avatar_url) }
      it { should respond_to(:company) }

      # sanityyyyy
      it { should_not respond_to(:bears_slain) }
    end

    context "#reports" do
      it "returns a list of reports for the active user" do
        VCR.use_cassette("user/reports") do
          reports = user.reports

          reports.should be_a(Array)
          reports.first.should be_a(Report)
        end
      end
    end

    context "#usage" do
      it "returns usage details for the active user" do
        VCR.use_cassette("user/usage") do
          usage = user.usage

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
          user.active?.should be_true
        end
      end
    end
  end
end