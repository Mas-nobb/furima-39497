class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_fee_status
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_day_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_fee_status_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  # バリデーションのカスタムメソッドを定義して、半角数値のみが入力されていることを確認します
  validate :validate_price_format

  private

  def validate_price_format
    errors.add(:price, 'は半角数字で入力してください') if price.to_s !~ /\A[0-9]+\z/
  end
end
