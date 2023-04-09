class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many :tag_articles ,dependent: :destroy
  has_many :tags , through: :tag_articles
end
