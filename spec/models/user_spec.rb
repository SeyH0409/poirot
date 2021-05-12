require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    context "新規登録できるとき" do
      it "nickname, email, passwordが正しく記述されているとき" do
        expect(@user).to be_valid
      end
    end

    context "新規登録できないとき" do
      it "nicknameが空の時" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空の時" do
        @user.email = nil 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailが重複している時" do #テスト失敗
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@が含まれていない時" do
        @user.email = "test.test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空の時" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end


      it "passwordが6文字未満の時" do 
        @user.password = "test1"
        @user.password_confirmation = "test1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英字のみの時" do
        @user.password = "testtest"
        @user.password_confirmation = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角数字のみの時" do
        @user.password = "12345678910"
        @user.password_confirmation = "12345678910"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordに全角文字が使われている時" do
        @user.password = "test1あ"
        @user.password_confirmation = "test1あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordに全角数字が使われている時" do
        @user.password = "test１２"
        @user.password_confirmation = "test１２"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordとpassword_confirmationが不一致の時" do
        @user.password = "test12"
        @user.password_confirmation = "test21"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "password_confirmaitonが空の時" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
