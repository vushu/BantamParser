module PrattParser
  class CallExpression < Expression
    def initialize(@function : Expression, @args : Array(Expression))
    end

    def print(builder)
      builder << "("

      @args.each_with_index do |arg, index|
        arg.print(builder)

        builder << ", " if index < @args.size - 1
      end

      builder << ")"
    end
  end
end
