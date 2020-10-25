class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password_confirmation
    validates :nickname
    validates :password, if: Proc.new { |user| user.password.present? }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}+\z/i,
                                                    message: 'は半角英字・半角数字混合で入力してください' }
    validates :last_name, format: { with: /\p{Han}|\p{Hiragana}|\p{Katakana}+\z/,
                                                    message: 'は漢字・ひらがな・全角カタカナで入力してください' }
    validates :first_name, format: { with: /\p{Han}|\p{Hiragana}|\p{Katakana}+\z/,
                                                    message: 'は漢字・ひらがな・全角カタカナで入力してください' }
    validates :last_name_kana, format: { with: /\p{Katakana}+\z/,
                                                    message: 'は全角カタカナで入力してください' }
    validates :first_name_kana, format: { with: /\p{Katakana}+\z/,
                                                    message: 'は全角カタカナで入力してください' }
    validates :birth
  end
end
