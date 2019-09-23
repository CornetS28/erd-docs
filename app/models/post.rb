# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  validates :content, length: { maximum: 285 }, presence: true
end
