class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          # sessionsコントローラーで使用する定義
  has_many :carts
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  
  has_many :addresses, dependent: :destroy
  
  def total_price
    sum = 0
    self.carts.each do |cart_item|
     sum += cart_item.quantity * cart_item.item.non_taxed_price
    end
    return sum
  end
end

  has_many :addresses, dependent: :destroy
end