class Article < ApplicationRecord
  belongs_to :tag
  has_one_attached :article_image
end
