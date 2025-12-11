class Comment < ApplicationRecord
  belongs_to :post
  validates :author_name, presence: true
  validates :content, presence: true
end
