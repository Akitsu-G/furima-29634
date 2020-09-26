class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :orders

  validates :nickname, presence: true
  # validates :email, deviseのデフォルト適用
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}+\z/i,
                                 message: 'は半角英字・半角数字混合で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ゝ〱ーヴ]+\z/,
                                                  message: 'は漢字・ひらがな・全角カタカナで入力してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ゝ〱ーヴ]+\z/,
                                                   message: 'は漢字・ひらがな・全角カタカナで入力してください' }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ンヴー]+\z/,
                                                       message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ンヴー]+\z/,
                                                        message: 'は全角カタカナで入力してください' }
  validates :birth, presence: true
end
