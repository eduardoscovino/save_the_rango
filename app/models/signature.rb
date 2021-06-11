class Signature < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
  has_one_attached :photo
end
