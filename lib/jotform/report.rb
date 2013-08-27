require "jotform/api_method"
require "jotform/form"

module JotForm
  class Report < APIMethod
    has :id
    has :form_id
    has :title
    has :fields
    has :list_type
    has :url
    has :isProtected, alias: :protected?
    has :status

    def initialize(data = nil, form = nil)
      super(@data)
      @form = nil
    end
    
    # load report data on-demand:
    # 
    # @return [Hash]
    def all
      @data ||= get("report/#{all['id']}")
      super
    end

    # loads and returns the form for which this report
    # was generated
    def form
      @form ||= Form.new(get("form/#{all['form_id']}")).use_api(@api)
    end
  end
end