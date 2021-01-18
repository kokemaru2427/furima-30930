require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全てのカラムが正常値であれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が無ければ保存できない" do
        @user.email = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "同じemailでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
      end
      it "passwordが前角では登録できない" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "aaaa1"
        @user.password_confirmation = "aaaa1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "ユーザー本名は、名字が空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it "ユーザー本名は、名前が空では登録できない" do
        @user.last_name  = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "ユーザー本名（名字）は、全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.family_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "ユーザー本名（名前）は、全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "ユーザー本名(フリガナ)の名字が空では登録できない" do
        @user.j_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("J family name can't be blank")
      end
      it "ユーザー本名(フリガナ)の名前が空では登録できない" do
        @user.j_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("J last name can't be blank", "J last name is invalid")
      end
      it "ユーザー本名(フリガナ)の名字が全角カナ以外ではでは登録できない" do
        @user.j_family_name = "亞あa"
        @user.valid?
        expect(@user.errors.full_messages).to include("J family name is invalid")
      end
      it "ユーザー本名(フリガナ)の名前が全角カナ以外ではでは登録できない" do
        @user.j_last_name = "亞あa"
        @user.valid?
        expect(@user.errors.full_messages).to include("J last name is invalid")
      end
      it "生年月日が空では登録できない" do
        @user.birthday   = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
