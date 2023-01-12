module PrattParser
  # Parselet for conditional "ternary" operator, a ? b : c
  class ConditionalParselet < InfixParselet
    def parse(parser : Parser, left : Expression, token : Token) : Expression
      then_arm = parser.parse_expression
      parser.consume(TokenType::COLON)
      else_arm = parser.parse_expression(Precedence::CONDITIONAL.value - 1)
      ConditionalExpression.new(left, then_arm, else_arm)
    end

    def get_precedence : Int
      Precedence::CONDITIONAL.value
    end
  end
end
