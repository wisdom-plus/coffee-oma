# == Schema Information
#
# Table name: recipes
#
#  id          :bigint           not null, primary key
#  amount      :integer          not null
#  grinding    :string(255)      not null
#  powdergram  :integer          not null
#  temperature :integer          not null
#  time        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Recipe < ApplicationRecord
  attr_writer :time1, :time2

  before_validation :set_time

  def time1
    @time1 ||= time.present? ? time/60 : nil
  end

  def time2
    @time2 ||= time.present? ? time%60 : nil
  end

  private

  def set_time
    self.time = time1.present? && time2.present? ? time1.to_i*60+time2.to_i : nil
  end
end
