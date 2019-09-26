# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :user_friends, -> { where(status: true) }, foreign_key: :user_id, class_name: :Friend
  has_many :friends, through: :user_friends, source: :friend
  has_many :user_friend_requests, -> { where(status: false) }, foreign_key: :user_id, class_name: :Friend
  has_many :friend_requests, through: :user_friend_requests, source: :friend
  has_many :request_users, -> { where(status: false) }, foreign_key: :friend_id, class_name: :Friend
  has_many :requests, through: :request_users, source: :user
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :surname, :email, :first_name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.username = auth.info.username
      user.surname = auth.info.name.split(' ')[0]
      user.first_name = !auth.info.name.split(' ')[1].nil? ? auth.info.name.split(' ')[1] : ' '
      user.image_url = auth.info.image
    end
  end
end
