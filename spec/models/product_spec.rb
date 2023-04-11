require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save succesfully with all 4 fields' do
      category = Category.create(name: 'Electronics')
      a_product = Product.new
      a_product.name = "Laptop"
      a_product.price_cents = 100000
      a_product.quantity = 5
      a_product.category = category
      expect(a_product.save).to be_truthy
    end

    it 'should not save if name field is missing' do
      category = Category.create(name: 'Electronics')
      a_product = Product.new
      a_product.name = nil
      a_product.price_cents = 100000
      a_product.quantity = 5
      a_product.category = category
      expect(a_product).to_not be_valid
      expect(a_product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save if price field is missing' do
      category = Category.create(name: 'Electronics')
      a_product = Product.new
      a_product.name = "Laptop"
      a_product.price_cents = nil
      a_product.quantity = 5
      a_product.category = category
      expect(a_product).to_not be_valid
      expect(a_product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save if quantity field is missing' do
      category = Category.create(name: 'Electronics')
      a_product = Product.new
      a_product.name = "Laptop"
      a_product.price_cents = 100000
      a_product.quantity = nil
      a_product.category = category
      expect(a_product).to_not be_valid
      expect(a_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save if category field is missing' do
      category = Category.create(name: 'Electronics')
      a_product = Product.new
      a_product.name = "Laptop"
      a_product.price_cents = 100000
      a_product.quantity = 5
      a_product.category = nil
      expect(a_product).to_not be_valid
      expect(a_product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
