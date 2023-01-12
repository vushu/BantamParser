module PrattParser
  # * Parses parentheses used to group an expression, like "a * (b + c)".
  class GroupParselet < PrefixParselet
    def parse(parser : Parser, token : Token) : Expression
      expression = parser.parse_expression
      parser.consume(TokenType::RIGHT_PAREN)
      expression
    end
  end
end
