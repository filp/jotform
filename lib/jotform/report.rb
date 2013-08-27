require "jotform/api_method"

module JotForm
  class Report < APIMethod
    
    # load report data on-demand:
    # 
    # @return [Hash]
    def all
      @data ||= get("report/#{all['id']}")
      super
    end

    # JotForm has some wonky parameter naming.
    def protected?
      all["isProtected"]
    end
  end
end