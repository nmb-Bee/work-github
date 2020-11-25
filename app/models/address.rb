class Address < ApplicationRecord

  belongs_to :customer

  validates :customer_id, :name, :address, presence: true
  validates :zipcode, length: {is: 7}, numericality: { only_integer: true } #郵便番号が７桁で数字のみ認めるバリテーション
end
