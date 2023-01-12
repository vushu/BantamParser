module PrattParser
  class PrefixOperatorParselet < PrefixParselet

    def parse(parser : Parser, token : Token) : Expression
      operand : Expression = parser.parse_expression
      PrefixExpression.new(token.type, operand)
    end
  end
end
