class Post < ApplicationRecord
    validates :title, presence: true, length: {minimum: 5}
    validates :body, presence: true
    has_many :post_tags
    has_many :tags, through: :post_tags
    has_many :comments, dependent: :destroy
end
