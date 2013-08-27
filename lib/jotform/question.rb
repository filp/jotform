require "jotform/api_method"

module JotForm
  class Question < APIMethod
    # This one is going to be hell to work with, API responses
    # are a bit wonky right now! (abc: "No", foo: "None", bar: "Yes" o_O)
  end
end