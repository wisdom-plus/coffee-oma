class BeanReviewForm
  inculde ActiveModel::Model
  attr_accessor :title,:content,:acidity, :bitter,:flavor,
                :rich, :sweet,:amount,:grinding,
                :powdergram,:temperature,:time1,:time2

  validate :title,:content, presence: true
  validates :acidity,
  :bitter,
  :flavor,
  :rich,
  :sweet,
  numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5
  }
  validates :powdergram, :grinding, :temperature, :time, :amount, presence: true
  validates :time, :temperature, :powdergram, :amount, numericality: {
    greater_than_or_equal_to: 0
  }
  enum grinding: { 極細挽き: 0, 細挽き: 1, 中細挽き: 2, 中挽き: 3, 中粗挽き: 4, 粗挽き: 5, 極粗挽き: 6 }

  before_validation :set_time

  delegate :persisted?, to: :bean_revie

  def time1
    @time1 ||= time.present? ? time / 60 : nil
  end

  def time2
    @time2 ||= time.present? ? time % 60 : nil
  end

  def initialize(attributes = nil, bean_review: Beanreview.new )
    @bean_review = bean_review
    attributes ||= defaut_attributes
    super(attributes)
  end

  def save
    return if invalid?
    ActiveRecord::Base.transaction do
      bean_review.update!(title: title,content: content)
    end
  end

  def to_model
    bean_review
  end

  private

  attr_reader :bean_review

  def default_attributes
    {
      title: bean_review.title,
      content: bean_review.content,
      acidity: bean_review.acidity,
      bitter: bean_review.bitter,
      flavor: bean_review.flavor,
      rich: bean_review.rich,
      sweet: bean_review.sweet,
      user_id: bean_review.user.id,
      bean_id: bean_review.bean.id

    }
  end

  def set_time
    self.time = (time1.present? && time2.present? ? ((time1.to_i * 60) + time2.to_i) : nil)
  end

end

