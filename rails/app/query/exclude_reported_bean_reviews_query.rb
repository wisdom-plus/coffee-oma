class ExcludeReportedBeanReviewsQuery < Query
  def initialize(relation = BeanReview.all)
    super(relation)
    @relation = relation
  end

  def call(bean_id, user_id)
    relation.includes(:user, :recipe).unreported_reviews(bean_id).or(relation.reviews_reported_other(bean_id, user_id))
  end
end
