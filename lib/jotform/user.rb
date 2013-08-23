require "time"

module JotForm
  class User < APIMethod
    # Returns the full hash of details for the active user.
    # 
    #   user.details
    #     # => {
    #        "username": "johnsmith",
    #        "name": "John Smith",
    #        "email": "john@example.com",
    #        "website": "http://www.jotform.com",
    #        "time_zone": "America/New_York",
    #        "account_type": "http://api.jotform.com/system/plan/PREMIUM",
    #        "status": "ACTIVE",
    #        "created_at": "2013-06-24 18:43:21",
    #        "updated_at": "2013-06-25 19:01:52",
    #        "usage": "http://api.jotform.com/user/usage",
    #        "avatarUrl": "http://gravatar.com/avatar/c3308f0feb2f350cded9222f83fb9363",
    #        "company": "Interlogy, LLC"
    #       }
    # 
    # @return [Hash]
    def details
      @details ||= get "user"
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
    # @return [Hash]
    def usage
      @usage ||= get "user/usage"
    end

    def active?
      self.details["status"] == "ACTIVE"
    end

    # @return [String]
    def username
      self.details["username"]
    end

    # @return [Time]
    def created_at
      Time.parse(self.details["created_at"])
    end

    # @return [Time]
    def updated_at
      Time.parse(self.details["updated_at"])
    end
  end
end