require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "it should be valid when all attributes are valid" do
      @product = Product.new
      @category = Category.new
      @product.name = 'TestName'
      @product.price_cents = 5000
      @product.quantity = 7
      @category.name = 'TestName'
      @product.category = @category
      expect(@product.valid?).to be true
    end
    it "it should not be valid without a product name" do
      @product = Product.new
      @category = Category.new
      @product.name = nil
      @product.price_cents = 7000
      @product.quantity = 2
      @category.name = 'TestName'
      @product.category = @category
      expect(@product.valid?).to be false
    end
    it "it should not be valid without a price in cents" do
      @product = Product.new
      @category = Category.new
      @product.name = 'TestName'
      @product.price_cents = nil
      @product.quantity = 10
      @category.name = 'TestName'
      @product.category = @category
      expect(@product.valid?).to be false
      expect(@product.error.full_messages).to be true
    end
    it "it should not be valid without a valid quantity" do
      @product = Product.new
      @category = Category.new
      @product.name = 'TestName'
      @product.price_cents = 10000
      @product.quantity = nil
      @category.name = 'TestName'
      @product.category = @category
      expect(@product.valid?).to be false
    end
    it "it should not be valid without a category" do
      @product = Product.new
      @category = Category.new
      @product.name = 'TestName'
      @product.price_cents = 100
      @product.quantity = 20
      @product.category = nil
      expect(@product.valid?).to be false
    end
  end
end
