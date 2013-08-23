module JotForm
  # A lazy, polymorphic enumerable implementation
  class LazyList
    include Enumerable

    # @param [Enumerable] members
    def initialize(members, resolver)
      @members  = members
      @resolver = resolver
    end

    # @param [Block] block
    def each(&block)
      @members.each do |member|

        member = case
        when @resolver.is_a?(Class)
          @resolver.new(member)
        when @resolver.is_a?(Proc)
          @resolver.call(member)
        else
          raise ArgumentError, "Expected a class or a proc, got a #{member.class}"
        end

        block.call(member)
      end
    end
  end
end