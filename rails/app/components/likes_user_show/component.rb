# frozen_string_literal: true

class LikesUserShow::Component < ViewComponent::Base
  def initialize(likes:)
    @likes = LikeDecorator.decorate_collection(likes)
    super
  end
end
