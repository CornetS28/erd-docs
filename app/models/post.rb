class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :content, length: { maximum: 280 }, presence: true
end

