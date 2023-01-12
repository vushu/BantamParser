require "./all"

module PrattParser

	def setup_parser(parser : Parser)
		parser.register(TokenType::NAME, NameParselet.new)
		parser.register(TokenType::ASSIGN, AssignParselet.new)
		parser.register(TokenType::QUESTION, ConditionalParselet.new)
		parser.register(TokenType::LEFT_PAREN, GroupParselet.new)
		parser.register(TokenType::LEFT_PAREN, CallParselet.new)

		parser.prefix(TokenType::PLUS)
		parser.prefix(TokenType::MINUS)
		parser.prefix(TokenType::TILDE)
		parser.prefix(TokenType::BANG)

		parser.postfix(TokenType::BANG, Precedence::POSTFIX)

		parser.infix_left(TokenType::PLUS,     Precedence::SUM);
		parser.infix_left(TokenType::MINUS,    Precedence::SUM);
		parser.infix_left(TokenType::ASTERISK, Precedence::PRODUCT);
		parser.infix_left(TokenType::SLASH,    Precedence::PRODUCT);
		parser.infix_right(TokenType::CARET,    Precedence::EXPONENT);


	end

end
