class ExcludeReportedReviewsQuery < Query
  def initialize(relation = Review.all)
    super(relation)
    @relation = relation
  end

  def call(product_id, user_id)
    reviews_exclude_report(product_id, user_id)
  end

  private


  def reviews_exclude_report(product_id,user_id)
    relation.includes(:reports,:user).unreported_reviews(product_id).or(relation.reviews_reported_other(product_id, user_id))
  end

end
