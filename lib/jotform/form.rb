require "jotform/api_method"

module JotForm
  class Form < APIMethod
    has :id
    has :username
    has :title
    has :height
    has :url
    has :status
    has :new, alias: :unread_submissions
    has :count, alias: :total_submissions

    def all
      @data ||= get("form/#{all['id']}")
      super
    end

    # Are there any new, unread submissions for this form?
    def unread_submissions?
      unread_submissions > 0
    end

    def questions
      @questions ||= begin
        get("form/#{all['id']}/questions").map { |question| Question.new(question) }
      end
    end
  end
end