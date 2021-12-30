class Query
  def call
    raise NotImplementedError
  end

  private

    attr_reader :relation
end
