# frozen_string_literal: true

class Breadcrumb::Component < ViewComponent::Base
  def initialize(path:, model: nil)
    super
    @path = path.to_sym
    @model = model
  end
end
