class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, presence: true
  validates :price, presence: true
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
                  against: [:name],
                  using: {
                    tsearch: { prefix: true }
                  }
end
