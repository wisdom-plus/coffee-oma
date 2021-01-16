# == Schema Information
#
# Table name: recipes
#
#  id             :bigint           not null, primary key
#  amount         :integer          not null
#  grinding       :integer          default("極細挽き"), not null
#  powdergram     :integer          not null
#  temperature    :integer          not null
#  time           :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  bean_review_id :bigint
#
# Indexes
#
#  index_recipes_on_bean_review_id  (bean_review_id)
#
# Foreign Keys
#
#  fk_rails_...  (bean_review_id => bean_reviews.id)
#
class Recipe < ApplicationRecord
  belongs_to :bean_review
  validates :powdergram, :grinding, :temperature, :time, :amount, presence: true
  validates :time, :temperature, :powdergram, :amount, numericality: {
    greater_than_or_equal_to: 0
  }
  attr_writer :time1, :time2
  enum grinding: { 極細挽き: 0, 細引き: 1, 中細挽き: 2, 中挽き: 3, 中粗挽き: 4, 粗挽き:5, 極粗挽き: 6}

  before_validation :set_time

  def time1
    @time1 ||= time.present? ? time / 60 : nil
  end

  def time2
    @time2 ||= time.present? ? time % 60 : nil
  end

  private

    def set_time
      self.time = (time1.present? && time2.present? ? ((time1.to_i * 60) + time2.to_i) : nil)
    end
end
