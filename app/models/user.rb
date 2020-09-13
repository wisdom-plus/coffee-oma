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
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :review_likes, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: 'user'
  has_many :followers, through: :reverse_of_relationships, source: :user

  validates :username, presence: true
  mount_uploader :icon, IconUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :timeoutable

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
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user_id)
    relationship = self.relationships.find_by(follow_id: other_user_id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  def create_like(like_product_id)
    self.likes.find_or_create_by(product_id: like_product_id)
  end

  def destroy_like(like_id)
    like = self.likes.find_by(id: like_id)
    like.destroy if like
  end
end
