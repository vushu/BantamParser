module PrattParser
  class PrefixExpression < Expression
    def initialize(@operator : TokenType, @right_expression : Expression)
    end

    def print(builder)
      builder << "(#{@operator.punctuator}"
      @right_expression.print(builder)
      builder << ")"
    end
  end
end
