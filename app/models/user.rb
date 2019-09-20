# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :user_friends, -> { where(status: true) }, foreign_key: :user_id, class_name: :Friend
  has_many :friends, through: :user_friends, source: :friend
  has_many :user_friend_requests, -> { where(status: false) }, foreign_key: :user_id, class_name: :Friend
  has_many :friend_requests, through: :user_friend_requests, source: :friend
  has_many :request_users, -> { where(status: false) }, foreign_key: :friend_id, class_name: :Friend
  has_many :requests, through: :request_users, source: :user
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :surname, :email, :first_name, presence: true

end


