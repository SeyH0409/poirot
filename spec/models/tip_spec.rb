require 'rails_helper'

RSpec.describe Tip, type: :model do
  describe "投げ銭機能" do
    before do
      @tip = FactoryBot.build(:tip)
    end

    context "投げ銭できる時" do
      it "priceとtokenが存在し、userとnovelに紐付いている時" do
        expect(@tip).to be_valid
      end
    end

    context "投げ銭できない時" do
      it "priceが空の時" do
        @tip.price = nil
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが全角数字の時" do
        @tip.price = "５００"
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Price is not a number")
      end

      it "priceが49円以下の時" do
        @tip.price = 49
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Price must be greater than 9")
      end

      it "priceが1001円以上の時" do
        @tip.price = 1001
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Price must be less than 1001")
      end

      it "tokenが空の時" do
        @tip.token = ""
        @tip.valid?
        expect(@tip.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
