class Comment < ApplicationRecord
  validates :body, :user, :post, presence: true
end
