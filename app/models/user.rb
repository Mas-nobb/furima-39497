class User < ApplicationRecord
  # association
  has_many :items

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation
  validates :nickname, presence: true
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # 全角漢字・ひらがな・カタカナ
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } # 全角漢字・ひらがな・カタカナ
  validates :last_name_kana,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナ
  validates :first_name_kana,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } # 全角カタカナ
  validates :birthday,           presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i } # 半角英数字混合
end
