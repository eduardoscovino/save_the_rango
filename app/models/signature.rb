class Signature < ApplicationRecord
  has_many :subscriptions, dependent: :destroy
end
