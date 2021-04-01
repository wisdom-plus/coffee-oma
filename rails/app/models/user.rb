# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  icon                   :string(255)
#  profile                :text(65535)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  unconfirmed_email      :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  has_many :participant1_rooms, class_name: 'Room', foreign_key: 'participant1_id', dependent: :destroy, inverse_of: 'participant1'
  has_many :participant2_rooms, class_name: 'Room', foreign_key: 'participant2_id', dependent: :destroy, inverse_of: 'participant2'
  has_many :messages, dependent: :destroy
  has_many :beans, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bean_reviews, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bean_likes, dependent: :destroy
  has_many :product_likes, dependent: :destroy
  has_many :product_review_likes, dependent: :destroy
  has_many :bean_review_likes, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: 'user'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy, inverse_of: 'visitor'
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy, inverse_of: 'visited'

  validates :username, presence: true
  mount_uploader :icon, IconUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable, :async

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confitmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update(params, *options)
    clean_up_passwords
    result
  end

  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by(follow_id: other_user.id)
  end

  def unfollow(other_user_id)
    relationship = relationships.find_by(follow_id: other_user_id)
    relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def follow_user(other_user)
    relationships.find_by(follow_id: other_user.id)
  end

  def create_review(review_params)
    reviews.create(review_params)
  end

  def create_bean_review(review_params)
    bean_reviews.create(review_params)
  end

  # product_like,bean_like,product_review_like,bean_review_likeを作成するメソッド
  # 引数は対象のidとtypeの名前をstringで受け取る
  def create_like(like_model_names, liked_id)
    case like_model_names
    when 'Product'
      product_likes.find_or_create_by(liked_id: liked_id)
    when 'Bean'
      bean_likes.find_or_create_by(liked_id: liked_id)
    when 'Review'
      product_review_likes.find_or_create_by(liked_id: liked_id)
    when 'BeanReview'
      bean_review_likes.find_or_create_by(liked_id: liked_id)
    end
  end

  # product_like,bean_like,product_review_like,bean_review_likeを削除するメソッド
  # 引数は対象のidとtypeの名前をstringで受け取る
  def destroy_like(like_model_names, liked_id)
    like =  case like_model_names
            when 'ProductLike'
              product_likes.find_by(id: liked_id)
            when 'BeanLike'
              bean_likes.find_by(id: liked_id)
            when 'ProductReviewLike'
              product_review_likes.find_by(id: liked_id)
            when 'BeanReviewLike'
              bean_review_likes.find_by(id: liked_id)
            end
    like&.destroy unless like.nil?
  end

  def create_or_update_history(params)
    h = case params[:controller]
        when 'products'
          histories.find_or_create_by(product_id: params[:id])
        when 'beans'
          histories.find_or_create_by(bean_id: params[:id])
        end
    h.update(updated_at: Time.zone.now)
  end

  def create_notification_follow(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ?', current_user.id, id, 'follow'])
    return if temp.present?

    notification = current_user.active_notifications.new(visited_id: id, action: 'follow')
    notification.save
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.username = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.zone.now
    end
  end
end
