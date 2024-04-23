require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'saves successfully when all fields are set' do
      @category = Category.new name: 'Test Category'
      @product = Product.new name: "Test product", price: 1, quantity: 10, category: @category

      expect(@product).to be_valid
    end

    it 'has a name when the name field is set' do
      # @category = Category.new name: 'Test Category'
      @product = Product.new name: "Test product", price: nil, quantity: nil, category: nil

      expect(@product.name).to eql("Test product")
    end

    it 'has a price when the price field is set' do
      # @category = Category.new name: 'Test Category'
      @product = Product.new name: nil, price: 1, quantity: nil, category: nil

      expect(@product.price_cents).to eql(100)
    end

    it 'has a quantity when the quantity field is set' do
      # @category = Category.new name: 'Test Category'
      @product = Product.new name: nil, price: nil, quantity: 10, category: nil

      expect(@product.quantity).to eql(10)
    end
    it 'has a price when the price field is set' do
      @category = Category.new name: 'Test Category'
      @product = Product.new name: nil, price: nil, quantity: nil, category: @category

      expect(@product.category.name).to eql('Test Category')
    end
  end
end
