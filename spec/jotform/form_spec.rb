require "spec_helper"

module JotForm
  describe Form do
    let(:form) do
      VCR.use_cassette("form/details") do
        # to-do: do not hard-code this id:
        JotForm::API.new(ENV["JOTFORM_API_KEY"]).form("32382056214851")
      end
    end

    subject { form }

    describe "form properties" do
      it { should respond_to(:id) }
      it { should respond_to(:username) }
      it { should respond_to(:title) }
      it { should respond_to(:height) }
      it { should respond_to(:url) }
      it { should respond_to(:status) }
      it { should respond_to(:unread_submissions) }
      it { should respond_to(:total_submissions) }
    end
  end
end