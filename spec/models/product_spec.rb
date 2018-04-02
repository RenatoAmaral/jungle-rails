require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
      @product = Product.new(name:'Special Shoes', price: 200, quantity: 10, category: @category)
    end

    # context "given 4 valid params" do
    #
    #    it "should be valid with all four fields valid" do
    #      expect(@product).to be_valid
    #    end
    # end


    context "given invalid parameters" do

       it "Should be have a name present" do
         @product.name = nil
         expect(@product).to_not be_valid
     end

     it "Should not be valid without a valid price" do
       @product.price_cents = nil
       expect(@product).to_not be_valid
     end

     it "Should not be valid without a quantity parameter" do
       @product.quantity = nil
       expect(@product).to_not be_valid
     end

     it "Should not be valid without a category" do
       @product.category = nil
       expect(@product).to_not be_valid
     end
   end

 end
end
