class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :price, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }
end
