class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :orders
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_fee_status
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, exclusion: { in: [1] }
  validates :condition_id, presence: true, exclusion: { in: [1] }
  validates :shipping_day_id, presence: true, exclusion: { in: [1] }
  validates :prefecture_id, presence: true, exclusion: { in: [1] }
  validates :shipping_fee_status_id, presence: true, exclusion: { in: [1] }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  # バリデーションのカスタムメソッドを定義して、半角数値のみが入力されていることを確認します
  validate :validate_price_format

  private

  def validate_price_format
    errors.add(:price, 'Input half-width characters') if price.to_s !~ /\A[0-9]+\z/
  end
end
