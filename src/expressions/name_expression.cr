module PrattParser
  class NameExpression < Expression
    getter name

    def initialize(@name : String)
    end

    def print(builder)
      builder << @name
    end
  end
end
