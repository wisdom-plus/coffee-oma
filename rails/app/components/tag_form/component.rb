# frozen_string_literal: true

class TagForm::Component < ViewComponent::Base

  def initialize(tags:,target:,current_user:)
    @tags = tags
    @target = target
    @current_user = current_user
  end

  def user_signed_in?
    @current_user.present?
  end
end
