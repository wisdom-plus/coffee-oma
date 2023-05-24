# frozen_string_literal: true

class Breadcrumb::Component < ViewComponent::Base
  def initialize(path:)
    super
    @path = path.to_sym
  end
end
