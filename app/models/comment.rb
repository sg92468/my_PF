class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio

  validates :comment, presence: true
end
