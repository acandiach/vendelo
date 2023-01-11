class Product < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    title: 'A',
    description: 'B'
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true

  has_one_attached :photo

  belongs_to :category
end
