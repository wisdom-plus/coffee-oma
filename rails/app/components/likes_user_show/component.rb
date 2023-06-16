# frozen_string_literal: true

class LikesUserShow::Component < ViewComponent::Base

  def initialize(likes:)
    @likes = likes
  end
end
