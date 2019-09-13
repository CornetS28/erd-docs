# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :content, length: { maximum: 285 }, presence: true
end
