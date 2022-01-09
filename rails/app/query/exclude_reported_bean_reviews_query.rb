class ExcludeReportedBeanReviewsQuery < Query
  def initialize(relation = BeanReview.all)
    super(relation)
    @relation = relation
  end

  def call(bean_id, user_id)
    unreported_reviews(bean_id).or(reviews_reported_other(bean_id, user_id))
  end

  private

    def unreported_reviews(bean_id)
      @relation.includes(:user, :recipe).eager_load(:reports).where(bean_id: bean_id).where(reports: { user_id: nil })
    end

    def reviews_reported_other(bean_id, user_id)
      @relation.eager_load(:reports).where(bean_id: bean_id).where.not(reports: { user_id: user_id })
    end
end
