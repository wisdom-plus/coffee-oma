class BeanReviewForm
  include ActiveModel::Model
  attr_accessor :title, :content, :acidity, :bitter, :flavor,
                :rich, :sweet, :amount, :grinding,
                :powdergram, :temperature, :time1, :time2, :time,
                :bean_id, :bean_error, :recipe_error

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
      bean_review = bean_review_create(current_user)

      if recipe_params_exists?
        unless recipe_params_full_filled?
          recipe_error = true
          raise ActiveRecord::Rollback
        end
        bean_review.build_recipe(recipe_params)
      end

      bean_review.save!
    end
  end

  def to_model
    BeanReview.new
  end

  private

    def bean_review_create(current_user)
      current_user.bean_reviews.new(bean_review_params)
    end

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

    def recipe_params_full_filled?
      amount.present? && grinding.present? && powdergram.present? && temperature.present? && time1.present? && time2.present?
    end

    def recipe_params_exists?
      amount.present? || grinding.present? || powdergram.present? || temperature.present? || time1.present? || time2.present?
    end
end
