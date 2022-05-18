class Query
  class << self
    delegate :call, to: :new
  end

  def initialize(relation)
    @relation = relation
  end

  # :nocov:
  def call
    raise NotImplementedError
  end
  # :nocov:

  private

    attr_reader :relation
end
