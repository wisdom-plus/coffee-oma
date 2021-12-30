class ReviewsQuery < Query
  def initialize(relation = Review.all)
    super
    @relation = relation
  end

  def call(product_id, user_id)
    relation.includes(:user).review_exclude_report(product_id, user_id)
  end
end
