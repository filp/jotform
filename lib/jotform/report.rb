require "jotform/api_method"

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
    
    # load report data on-demand:
    # 
    # @return [Hash]
    def all
      @data ||= get("report/#{all['id']}")
      super
    end
  end
end