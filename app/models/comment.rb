class Comment < ApplicationRecord
  validates :body, :user, :new, presence: true
end
