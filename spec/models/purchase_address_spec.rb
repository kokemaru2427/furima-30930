require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  context '商品購入ができる時' do
    it "必要な情報を適切に入力すると、商品の購入ができること" do
      expect(@purchase).to be_valid
    end

    it "建物名がなくても、商品の購入ができること" do
        @purchase.building = ""
        expect(@purchase).to be_valid
    end
  end

  context '商品購入ができない時' do
    it "クレジットカード情報が無ければ購入できない" do
      @purchase.token = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が無ければ購入できないこと" do
      @purchase.postal_code = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
    end

    it "郵便番号にはハイフンが無ければならないこと" do
      @purchase.postal_code = "1231234"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "都道府県が無ければ購入できないこと" do
      @purchase.prefecture = 0
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市区町村が無ければ購入できないこと" do
      @purchase.municipalities = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
    end

    it "番地が無ければ購入できないこと" do
      @purchase.residence = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Residence can't be blank")
    end

    it "電話番号が無ければ購入できないこと" do
      @purchase.phone_number = ""
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Input half-width characters.")
    end

    it "電話番号が12桁以上では購入できないこと" do
      @purchase.phone_number = "000000000000"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it "電話番号が英数混合では購入できないこと" do
      @purchase.phone_number = "a0000000000"
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end

    it "購入者が空では購入できないこと" do
      @purchase.user_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("User can't be blank")
    end

    it "商品が空では購入できないこと" do
      @purchase.item_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Item can't be blank")
    end
  end

end
