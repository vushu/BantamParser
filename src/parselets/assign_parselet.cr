module PrattParser
  class AssignParselet < InfixParselet
    def parse(parser : Parser, left : Expression, token : Token) : Expression
      puts "ehrererererer huhuhuhhu"
      NameExpression.new("dummyname exp")
    end

    def parse(parser : Parser, left : NameExpression, token : Token) : Expression
      # right = parser.parse_expression(Precedence::ASSIGNMENT.value - 1)
      puts "22222 huhuhuhhu"
      NameExpression.new("dummyname exp")
      # if right.nil?
      #   raise "wtf it's nil!"
      # end
      # puts "is nil? #{right.nil?}"

      # AssignExpression.new(left.name, right)
    end

    def get_precedence : Int
      Precedence::ASSIGNMENT.value
    end
  end
end
