class Tag < ApplicationRecord
  has_many :tag_aliases
  has_and_belongs_to_many :articles
end
