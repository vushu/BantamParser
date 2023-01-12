require "../expressions"

module PrattParser
  abstract class InfixParselet
    abstract def parse(parser : Parser, left : Expression, token : Token) : Expression
    abstract def get_precedence : Int
  end
end
