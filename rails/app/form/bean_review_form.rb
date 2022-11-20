class BeanReviewForm
  include ActiveModel::Model
  attr_accessor :title, :content, :acidity, :bitter, :flavor,
                :rich, :sweet, :amount, :grinding,
                :powdergram, :temperature, :time1, :time2, :time, :bean_id

  validates :title, :content, presence: true
  validates :acidity,
            :bitter,
            :flavor,
            :rich,
            :sweet,
            numericality: {
              greater_than_or_equal_to: 1,
              less_than_or_equal_to: 5
            }

  validates :time, :temperature, :powdergram, :amount, numericality: {
    greater_than_or_equal_to: 0
  }, allow_blank: true

  def save(current_user)
    return if invalid?

    ActiveRecord::Base.transaction do
      bean_review = current_user.bean_reviews.create!(bean_review_params)
      unless recipe_params_exists?
        recipe = bean_review.create_recipe!(recipe_params)
      end
      bean_review
    end
  end

  def to_model
    BeanReview.new
  end

  private

    def bean_review_params
      {
        title: title, content: content, acidity: acidity,
        flavor: flavor, rich: rich, sweet: sweet,
        bitter: bitter, bean_id: bean_id
      }
    end

    def recipe_params
      { amount: amount, grinding: grinding, powdergram: powdergram,
        temperature: temperature, time1: time1, time2: time2 }
    end

    def recipe_params_exists?
      amount.empty? && grinding.empty? && powdergram.empty? && temperature.empty? && time1.empty? && time2.empty?
    end
end
