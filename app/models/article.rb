class Article < ApplicationRecord
  has_one_attached :article_image
  has_and_belongs_to_many :tags
end
