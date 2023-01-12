module PrattParser
  class AssignParselet < InfixParselet
    def parse(parser : Parser, left : Expression, token : Token) : Expression
      parse(parser, left, token)
    end

    def parse(parser : Parser, left : NameExpression, token : Token) : Expression
      right = parser.parse_expression(Precedence::ASSIGNMENT.value - 1)
      AssignExpression.new(left.name, right)
    end

    def get_precedence : Int
      Precedence::ASSIGNMENT.value
    end
  end
end
