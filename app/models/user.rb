# frozen_string_literal: true

class User < ApplicationRecord
  before_create :add_profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }
 
  

  private

  def add_profile_image
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    self.image_link = gravatar_url
  end
end
