module PrattParser
  class AssignExpression < Expression
    def initialize(@name : String, @right_expression : Expression); end

    def print(builder)
      builder << "(#{@name} = )"
      @right_expression.print(builder)
      builder << ")"
    end
  end
end
