require 'rails_helper'

RSpec.describe Novel, type: :model do
  describe "新規執筆" do
    before do
      @novel = FactoryBot.build(:novel)
    end

    context "新規投稿できる時" do
      it "titleとcontentとimageが記述されていてユーザーが紐付いている時" do
        expect(@novel).to be_valid
      end
      it "imageが登録されていない時" do
        @novel.image = nil
        expect(@novel).to be_valid
      end
    end

    context "新規投稿できない時" do
      it "titleが空の時" do
        @novel.title = nil
        @novel.valid?
        expect(@novel.errors.full_messages).to include("Title can't be blank")
      end

      it "contentが空の時" do
        @novel.content = nil
        @novel.valid?
        expect(@novel.errors.full_messages).to include("Content can't be blank")
      end

      it "novelとuserが紐付いてない時" do
        @novel.user = nil
        @novel.valid?
        expect(@novel.errors.full_messages).to include("User must exist")
      end
    end
  end
end
