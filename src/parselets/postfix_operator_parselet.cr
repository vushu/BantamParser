module PrattParser
  class PostfixOperatorParselet < InfixParselet
    def initialize(@precedence : Int32)
    end

    def parse(parser : Parser, left : Expression, token : Token) : Expression
      PostfixExpression.new(left, token.type)
    end

    def get_precedence : Int
      @precedence
    end
  end
end
