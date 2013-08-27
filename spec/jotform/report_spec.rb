require "spec_helper"

module JotForm
  describe Report do
    let(:report) do
      VCR.use_cassette("user/reports") do
        API.new(ENV["JOTFORM_API_KEY"]).user.reports.first
      end
    end

    subject { report }

    describe "report properties" do
      it { should respond_to(:id) }
      it { should respond_to(:form_id) }
      it { should respond_to(:title) }
      it { should respond_to(:fields) }
      it { should respond_to(:list_type) }
      it { should respond_to(:url) }
      it { should respond_to(:protected?) }
      it { should respond_to(:status) }
    end
  end
end