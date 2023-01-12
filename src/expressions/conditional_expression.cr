module PrattParser
  class ConditionalExpression < Expression
    def initialize(@condition : Expression, @then_arm : Expression, @else_arm : Expression)
    end

    def print(builder)
      builder << "("
      @condition.print(builder)
      builder << " ? "
      @then_arm.print(builder)
      builder << " : "
      @else_arm.print(builder)
      builder << ")"
    end
  end
end
