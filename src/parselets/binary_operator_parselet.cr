module PrattParser
  # + , - , *, / and ^
  class BinaryOperatorParselet < InfixParselet
    def initialize(@precedence : Int32, @is_right : Bool)
    end

    def parse(parser : Parser, left : Expression, token : Token) : Expression
      # To handle right-associative operators like "^", we allow a slightly
      # lower precedence when parsing the right-hand side. This will let a
      # parselet with the same precedence appear on the right, which will then
      # take this parselet's result as its left-hand argument.

      right = parser.parse_expression(@precedence - (@is_right ? 1 : 0))
      OperatorExpression.new(left, token.type, right)
    end

    def get_precedence : Int
      @precedence
    end
  end
end
