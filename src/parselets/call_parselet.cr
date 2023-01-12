module PrattParser
  #  Parselet to parse a function call like "a(b, c, d)".
  class CallParselet < InfixParselet
    def parse(parser : Parser, left : Expression, token : Token) : Expression
      args = Array(Expression).new
      unless parser.match(TokenType::RIGHT_PAREN)
        loop do
          args.push(parser.parse_expression)
          break unless parser.match(TokenType::COMMA)
        end
        parser.consume(TokenType::RIGHT_PAREN)
      end
      CallExpression.new(left, args)
    end

    def get_precedence : Int
      Precedence::CALL.value
    end
  end
end
