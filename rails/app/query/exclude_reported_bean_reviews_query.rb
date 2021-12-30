class ExcludeReportedBeanReviewsQuery < Query
  def initialize(relation = BeanReview.all)
    super(relation)
    @relation = relation
  end

  def call(bean_id, user_id)
    relation.includes(:user, :recipe).review_exclude_report(bean_id, user_id)
  end
end
