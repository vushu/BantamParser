require "./spec_helper"
include PrattParser

describe PrattParser do
  # it "should consume successfully" do
  #   tokens = Array(Token).new
  #   token = Token.new(TokenType::LEFT_PAREN, "(")
  #   token1 = Token.new(TokenType::COMMA, ",")
  #   tokens.push(token)
  #   tokens.push(token1)
  #   parser = Parser.new(tokens.each)
  #   parser.consume(TokenType::LEFT_PAREN).should eq(token)
  #   parser.consume(TokenType::COMMA).should eq(token1)
  # end

  # it "should parse name using parselet" do
  #   tokens = Array(Token).new
  #   token = Token.new(TokenType::NAME, "hello")
  #   tokens.push(token)
  #   parser = Parser.new(tokens.each)

  #   parser.register(TokenType::NAME, NameParselet.new)

  #   expression = parser.parse_expression.as(NameExpression)
  #   expression.name.should eq("hello")
  # end

  it "should parse minus using default setup" do
    tokens = Array(Token).new
    token = Token.new(TokenType::MINUS, "-")
    tokens.push(token)
    # infite loop if we only add - operator since it needs
    # and operand
    tokens.push(Token.new(TokenType::NAME, "a"))

    parser = Parser.new(tokens.each)
    setup_parser(parser)

    expression = parser.parse_expression

    str_res = String.build do |str|
      expression.print(str)
    end
    str_res.should eq("(-a)")
  end
  it "should parse binary operation using default setup" do
    tokens = Array(Token).new

    token_a = Token.new(TokenType::NAME, "a")
    token_minus = Token.new(TokenType::MINUS, "-")
    token_b = Token.new(TokenType::NAME, "b")
    tokens.push(token_a)
    tokens.push(token_minus)
    tokens.push(token_b)
    # infite loop if we only add - operator since it needs
    # and operand
    parser = Parser.new(tokens.each)
    setup_parser(parser)

    expression = parser.parse_expression

    str_res = String.build do |str|
      expression.print(str)
    end
    str_res.should eq("(a - b)")
  end
end

# describe PrattParser do
# it "should print expression" do
# expression = SomethingExpression.new

# end
# end
