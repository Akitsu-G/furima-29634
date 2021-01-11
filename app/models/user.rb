class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\p{Han}|\p{Hiragana}|[ァ-ヶー－][ァ-ヶ　ー－]+/, message: 'は漢字・ひらがな・全角カタカナで入力してください' }
    validates :first_name, format: { with: /\p{Han}|\p{Hiragana}|[ァ-ヶー－][ァ-ヶ　ー－]+/, message: 'は漢字・ひらがな・全角カタカナで入力してください' }
    validates :last_name_kana, format: { with: /[ァ-ヶー－][ァ-ヶ　ー－]+/, message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: /[ァ-ヶー－][ァ-ヶ　ー－]+/, message: 'は全角カタカナで入力してください' }
    validates :birth
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}+\z/i, message: 'は半角英字・半角数字混合で入力してください' }
end
