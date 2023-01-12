module PrattParser
  class Token
    getter type
    getter text

    def initialize(@type : TokenType, @text : String)
    end

    def display_name
      "Type: #{type} Text: #{text}"
    end
  end

  enum TokenType
    LEFT_PAREN
    RIGHT_PAREN
    COMMA
    ASSIGN
    PLUS
    MINUS
    ASTERISK
    SLASH
    CARET
    TILDE
    BANG
    QUESTION
    COLON
    NAME
    EOF

    def punctuator
      case self
      when LEFT_PAREN
        '('
      when RIGHT_PAREN
        ')'
      when COMMA
        ','
      when ASSIGN
        '='
      when PLUS
        '+'
      when MINUS
        '-'
      when ASTERISK
        '*'
      when SLASH
        '/'
      when CARET
        '^'
      when TILDE
        '~'
      when BANG
        '!'
      when QUESTION
        '?'
      when COLON
        ':'
      else
        Nil
      end
    end
  end
end
