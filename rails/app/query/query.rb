class Query
  def initialize(relation)
    @relation = relation
  end

  def call
    raise NotImplementedError
  end

  private

    attr_reader :relation
end
