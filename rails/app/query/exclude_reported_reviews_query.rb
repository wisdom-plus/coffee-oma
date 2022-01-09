class ExcludeReportedReviewsQuery < Query
  def initialize(relation = Review.all)
    super(relation)
    @relation = relation
  end

  def call(product_id, user_id)
    unreported_reviews(product_id).or(reviews_reported_other(product_id, user_id))
  end

  private

    def unreported_reviews(product_id)
      @relation.includes(:reports, :user, :product_review_likes).eager_load(:reports).where(product_id: product_id, reports: { id: nil })
    end

    def reviews_reported_other(product_id, user_id)
      @relation.eager_load(:reports).where(product_id: product_id).where.not(reports: { user_id: user_id })
    end
end
