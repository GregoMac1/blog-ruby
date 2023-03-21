class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true
end
