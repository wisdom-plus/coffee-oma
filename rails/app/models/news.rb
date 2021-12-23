# == Schema Information
#
# Table name: news
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(FALSE)
#  content       :text(65535)
#  publicshed_at :datetime         not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_news_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => admin_users.id)
#
class News < ApplicationRecord
  has_rich_text :content
  belongs_to :user, class_name: 'AdminUser', optional: true

  scope :public_list, -> { where(['publicshed_at < ?', Time.current]) }
  scope :latest, ->{ order("publicshed_at DESC").limit(5) }

  def activate
    update(active: true)
  end

  def publicshed?
    publicshed_at < Time.current
  end

  def self.latest_news
    News.public_list.latest
  end
end
