require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    # p @user
  end

  describe 'user validates/ユーザー新規登録' do
    context '@user.save/成功' do
      it "nickname, email, password, last_name, first_name,
      first_name_kana, last_name_kana, birth が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'passwordが少なくとも1文字以上の半角英字・半角数字をそれぞれ含んでいれば登録できる' do
        @user.password = '0abcde'
        @user.password_confirmation = '0abcde'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'last_nameが、漢字・ひらがな・全角カタカナのいずれかであれば登録できる' do
        @user.last_name = '漢字ひらがなカタカナ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_nameが、漢字・ひらがな・全角カタカナのいずれかであれば登録できる' do
        @user.first_name = '漢字ひらがなカタカナ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'last_name_kanaが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'カタカナーヴ'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'first_name_kanaが全角カタカナであれば登録できる' do
        @user.first_name_kana = 'カタカナーヴ'
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '@user.save/失敗' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓を入力してください')
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名を入力してください')
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓(フリガナ)を入力してください')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名(フリガナ)を入力してください')
      end
      it 'birthが空だと登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
      it 'passwordが半角英字・半角数字以外を含んでいれば登録できない' do
        @user.password = '!?_123abc'
        @user.password_confirmation = '!?_123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字・半角数字混合で入力してください')
      end
      it 'passwordが少なくとも半角英字・半角数字をそれぞれ1文字づつ含んでいなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英字・半角数字混合で入力してください')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '012ab'
        @user.password_confirmation = '012ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordとpassword_confirmationが不一致であれば登録できない' do
        @user.password = '012abc'
        @user.password_confirmation = '987xyz'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが129文字以上であれば登録できない' do
        require 'securerandom'
        @user.password = 'abc456789' + SecureRandom.alphanumeric(120).to_s # 9文字+ランダム１２０字
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it 'emailが一意でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailが@を含まなければ登録できない' do
        @user.email = 'email.di-v.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'emailが@の前後に1文字以上の半角英数字がなければ登録できない' do
        @user.email = '@'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'last_nameに漢字・ひらがな・全角カタカナ以外があれば登録できない' do
        @user.last_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓は漢字・ひらがな・全角カタカナで入力してください')
      end
      it 'first_nameに漢字・ひらがな・全角カタカナ以外があれば登録できない' do
        @user.first_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名は漢字・ひらがな・全角カタカナで入力してください')
      end
      it 'last_name_kanaに全角カタカナ以外があれば登録できない' do
        @user.last_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓(フリガナ)は全角カタカナで入力してください')
      end
      it 'first_name_kanaに全角カタカナ以外があれば登録できない' do
        @user.first_name_kana = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名(フリガナ)は全角カタカナで入力してください')
      end
    end
  end
end
