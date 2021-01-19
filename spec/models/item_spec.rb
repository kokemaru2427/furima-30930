require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できるとき' do
      it "必要な情報を適切に入力すると、商品の出品ができること" do
        expect(@item).to be_valid
      end
    end

    context '出品出来ないとき' do
      it "商品画像が無いと出品出来ないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が無いと出品出来ないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が無いと出品出来ないこと" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーの情報が無いと出品出来ないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "商品の状態についての情報が無いと出品出来ないこと" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it "配送料の負担についての情報が無いと出品出来ないこと" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it "配送元の地域の情報が無いと出品出来ないこと" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "配送日までの日数の情報が無いと出品出来ないこと" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
      end

      it "価格についての情報が無いと出品出来ないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "価格の範囲が300~99,99,999でないと出品出来ない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it "販売価格が全角文字では出品出来ないこと" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が半角英数混合では登録できないこと" do
        @item.price = "1a0b0c0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "販売価格が半角英語だけでは登録できないこと" do
        @item.price = "abcabc"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end








    end
  end
end
