# frozen_string_literal: true

class BeanReviewForm::Component < ViewComponent::Base
  def initialize(form:, bean:)
    super
    @form = form
    @bean = bean
  end
end
