require "jotform/report"
require "ostruct"
require "time"

module JotForm
  class User < APIMethod
    has :username
    has :name
    has :email
    has :website
    has :time_zone
    has :account_type
    has :status
    has :avatarUrl, alias: :avatar_url
    has :company

    # @return [Array]
    def reports
      @reports ||= get("user/reports").map { |data| Report.new(data) }
    end

    # Returns full usage details for the active user
    # 
    #   user.usage
    #     # => {
    #        "submissions": "0",
    #        "ssl_submissions": "0",
    #        "payments": "0",
    #        "uploads": "0"
    #       }
    # 
    # @return [OpenStruct]
    def usage
      @usage ||= OpenStruct.new(get("user/usage"))
    end

    # decorate #all to load user data on-demand
    def all 
      @data ||= get("user")
      super
    end
  end
end