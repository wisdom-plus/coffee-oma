# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  amount      :integer          not null
#  grinding    :string(255)      not null
#  powdergram  :integer          not null
#  status      :boolean          default(FALSE)
#  temperature :integer          not null
#  time        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_recipes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Recipe < ApplicationRecord
  belongs_to :user
  validates :powdergram, :grinding, :temperature, :time, :amount, presence: true
  validates :time, :temperature, :powdergram, :amount, numericality: {
    greater_than_or_equal_to: 0
  }
  attr_writer :time1, :time2

  before_validation :set_time

  def time1
    @time1 ||= time.present? ? time / 60 : nil
  end

  def time2
    @time2 ||= time.present? ? time % 60 : nil
  end

  private

    def set_time
      (self.time = time1.present? && time2.present?) ? (time1.to_i * 60 + time2.to_i) : nil
    end
end
