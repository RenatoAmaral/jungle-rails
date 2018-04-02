require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before(:each) do
      @category = Category.new
      @product = Product.new(
        name:'Special Shoes',
        price: 200,
        quantity: 10,
        category: @category)
    end

    context "given 4 valid params" do

       it "should be valid with all four fields valid" do
         expect(@product).to be_valid
       end
    end


    context "given invalid parameters" do

       it "Should be have a name present" do
         @product.name = nil
         expect(@product).to_not be_valid
         expect(@product.errors.messages[:name]).to include('can\'t be blank')
     end

     it "Should not be valid without a price" do
       @product.price_cents = nil
       expect(@product).to_not be_valid
       expect(@product.errors.messages[:price]).to include('can\'t be blank')
     end

     it "Should not be valid without a quantity " do
       @product.quantity = nil
       expect(@product).to_not be_valid
       expect(@product.errors.messages[:quantity]).to include('can\'t be blank')
     end

     it "Should not be valid without a category" do
       @product.category = nil
       expect(@product).to_not be_valid
       expect(@product.errors.messages[:category]).to include('can\'t be blank')
     end
   end

 end
end
