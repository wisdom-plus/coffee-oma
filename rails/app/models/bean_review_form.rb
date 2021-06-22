class BeanReviewForm
  include ActiveModel::Model
  attr_accessor :title,:content,:acidity, :bitter,:flavor,
                :rich, :sweet,:amount,:grinding,
                :powdergram,:temperature,:time1,:time2,:time,:bean_id

  validates :title,:content, presence: true
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
  },allow_blank: true


  def save(current_user)
    return if invalid?
    ActiveRecord::Base.transaction do
      bean_review = BeanReview.create!(title: title,content: content,acidity: acidity,flavor: flavor,rich: rich, sweet: sweet,user: current_user ,bean_id: bean_id)
      unless (amount.empty? && grinding.empty? && powdergram.empty? && temperature.empty? && time1.empty? && time2.empty?)
        recipe = Recipe.create!(amount: amount,grinding: grinding, powdergram: powdergram, temperature: temperature, time1: time1,time2: time2,bean_review: bean_review)
      end
    end
  end

  def to_model
    bean_review = BeanReview.new
  end

  private

  attr_reader :bean_review

end

