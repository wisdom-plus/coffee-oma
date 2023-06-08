# frozen_string_literal: true

class HomeRanking::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(rankings:)
    @rankings = rankings
  end
end
