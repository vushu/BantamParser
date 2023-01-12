module PrattParser
  class PostfixExpression < Expression
    def initialize(@left : Expression, @operator : TokenType)
    end

    def print(builder)
      builder << "("
      @left.print(builder)
      builder << @operator.punctuator
      builder << ")"
    end
  end
end
