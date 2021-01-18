require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できるとき' do
      it "必要な情報を適切に入力すると、商品の出品ができること" do
        
      end
    end

    context '出品出来ないとき' do
      it "商品画像が無いと出品出来ないこと" do
      end

      it "商品名が無いと出品出来ないこと" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "商品の説明が無いと出品出来ないこと" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Explanation can't be blank")
      end

      it "カテゴリーの情報が無いと出品出来ないこと" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Category is not a number")
      end

      it "商品の状態についての情報が無いと出品出来ないこと" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "State is not a number")
      end

      it "配送料の負担についての情報が無いと出品出来ないこと" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Shipping charge is not a number")
      end

      it "配送元の地域の情報が無いと出品出来ないこと" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Prefecture is not a number")
      end

      it "配送日までの日数の情報が無いと出品出来ないこと" do
        @item.shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Shipping date is not a number")
      end

      it "価格についての情報が無いと出品出来ないこと" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Price is not a number")
      end

      it "価格の範囲が300~99,99,999でないと出品出来ない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Price must be greater than 300")
      end

      it "販売価格が半角数字飲みで無いと出品出来ない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist", "Price is not a number")
      end









    end
  end
end
