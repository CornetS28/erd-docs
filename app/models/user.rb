# frozen_string_literal: true

class User < ApplicationRecord
    has_many :posts, foreign_key: 'author_id', dependent: :destroy
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :name, presence: true

  end
  