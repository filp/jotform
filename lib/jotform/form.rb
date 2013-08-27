
module JotForm
  class Form
    def all
      @data ||= get("form/#{all['id']}")
      super
    end

    # @return [Integer]
    def unread_submissions
      all["new"]
    end

    # Are there any new, unread submissions for this form?
    def unread_submissions?
      unread_submissions > 0
    end

    # @return [Integer]
    def submissions
      all["count"]
    end

    def questions
      @questions ||= begin
        get("form/#{all['id']}/questions").map { |question| Question.new(question) }
      end
    end
  end
end