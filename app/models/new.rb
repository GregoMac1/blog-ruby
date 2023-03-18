class New < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  validates :title, :body, presence: true
end
