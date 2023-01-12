require "../expressions"

module PrattParser
  abstract class PrefixParselet
    abstract def parse(parser : Parser, token : Token) : Expression
  end
end
