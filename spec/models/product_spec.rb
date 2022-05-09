require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'bob')
    end
    it 'is valid with valid attributes' do
      product = Product.create(name: 'bob', price: 50, quantity: 5, category: @category)
      expect(product).to be_valid
    end
    it 'is invalid without a name' do
      product = Product.create(price: 50, quantity: 5, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'is invalid without a price' do
      product = Product.create(name: 'bob', quantity: 5, category: @category)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price cents is not a number", "Price is not a number")
    end
    it 'is invalid without a category' do
      product = Product.create(name: 'bob', price: 50, quantity: 5)
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank", "Category must exist")
    end
  end
end

# Price cents is not a number, Price is not a number, Category must exist, Name can't be blank, Price can't be blank, Quantity can't be blank, Category can't be blank