module PrattParser
  class OperatorExpression < Expression
    def initialize(@left : Expression, @operator : TokenType, @right : Expression); end

    def print(builder)
      builder << "("
      @left.print(builder)
      builder << " #{@operator.punctuator} "
      @right.print(builder)
      builder << ")"
    end
  end
end
