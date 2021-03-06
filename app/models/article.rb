class Article < ApplicationRecord
  has_one_attached :article_image
  has_and_belongs_to_many :tags
  has_many :notes, dependent: :destroy
  has_rich_text :content
end
