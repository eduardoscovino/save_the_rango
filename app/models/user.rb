class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :basket
  has_one :subscription
  after_create :create_basket

  def create_basket
    Basket.create(user: self)
  end
end
