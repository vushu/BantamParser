module PrattParser
  class Parser
    def initialize(@tokens : Iterator(Token))
      @infix_parselets = Hash(TokenType, InfixParselet).new
      @prefix_parselets = Hash(TokenType, PrefixParselet).new
      @read_tokens = Array(Token).new
    end

    def parse_expression(precedence : Int = 0) : Expression
      token = consume

      if token.nil?
        raise "Token is nil"
      end

      unless @prefix_parselets.has_key? token.type
        raise "---> PREFIX is nil <---"
      end
      prefix = @prefix_parselets[token.type]

      if prefix.nil?
        raise "Could not parse #{token.text}"
      end

      # puts "we are HERE #{token.text}"
      left = prefix.parse(self, token)

      puts "current precedence: #{precedence}"
      while precedence < get_precedence
        # if get_precedence is 0 we don't enter
        puts "hehehehehehe"
        token = consume

        unless @infix_parselets.has_key? token.type
          raise "---> INFIX IS NUL <---"
        end

        infix = @infix_parselets[token.type]
        left = infix.parse(self, left, token)
      end

      left
    end

    def register(token_type, parselet : PrefixParselet)
      @prefix_parselets[token_type] = parselet
    end

    def register(token_type, parselet : InfixParselet)
      @infix_parselets[token_type] = parselet
    end

    def prefix(token_type : TokenType)
      register(token_type, PrefixOperatorParselet.new)
    end

    def infix_left(token_type : TokenType, precedence : Precedence)
      register(token_type, BinaryOperatorParselet.new(precedence.value, false))
    end

    def infix_right(token_type : TokenType, precedence : Precedence)
      register(token_type, BinaryOperatorParselet.new(precedence.value, true))
    end

    def postfix(token_type : TokenType, precedence : Precedence)
      register(token_type, PostfixOperatorParselet.new(precedence.value))
    end

    def match(expected_token_type : TokenType) : Bool
      token = look_ahead(0)
      unless token.type == expected_token_type
        return false
      end
      consume
      true
    end

    def consume(expected : TokenType) : Token
      token = look_ahead(0)
      unless token.type == expected
        raise "Expected token #{expected} and found #{token.type}"
      end
      consume
    end

    def consume : Token
      look_ahead(0)
      first = @read_tokens.first
      @read_tokens.delete_at(0)
      puts "consumed [ #{first.text} ]"
      # puts @read_tokens.size
      first
    end

    def get_precedence : Int
      token = look_ahead(0)
      if token.nil?
        puts "NO MORE LOOK AHEAD"
        return 0
      end
      unless @infix_parselets.has_key? token.type
        # puts "Missing parselet to handle #{token.type}"
        return 0
      end
      @infix_parselets[token.type].get_precedence
    end

    private def look_ahead(distance : Int) : Token
      while distance >= @read_tokens.size
        puts "distance: #{distance} while loop look_ahead #{@read_tokens.size}"
        tok = @tokens.next
        if tok != Iterator::Stop::INSTANCE
          t = tok.as(Token)
          @read_tokens.push(t)
        else
          # keep sending EOF so we don't run out of tokens
          @read_tokens.push(Token.new(TokenType::EOF, ""))
        end
      end
      @read_tokens[distance]
    end
  end
end
