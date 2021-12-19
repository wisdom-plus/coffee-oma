module LikesHasMany
  extend ActiveSupport::Concern

  included do
    has_many :likes, dependent: :destroy
    has_many :bean_likes, dependent: :destroy
    has_many :product_likes, dependent: :destroy
    has_many :product_review_likes, dependent: :destroy
    has_many :bean_review_likes, dependent: :destroy
  end

end
