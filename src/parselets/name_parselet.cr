module PrattParser
	class NameParselet < PrefixParselet
		def parse(parser, token : Token) : Expression
			NameExpression.new(token.text)
		end
	end
end
