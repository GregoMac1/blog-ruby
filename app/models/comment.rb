class Comment < ApplicationRecord
  belongs_to :post
  
  validates :body, :user_id, :post_id, presence: true
end
