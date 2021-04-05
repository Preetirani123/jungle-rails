require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    it 'should create a new product when all fields are present' do
      @category = Category.new(name: "Furniture")
      @category.save!
      @product = Product.new(name: "name", price: 987.65, quantity: 0, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should not save if name is empty' do
      @category = Category.new(name: "Furniture")
      @category.save!
      @product = Product.new(name: nil, price: 987.65, quantity: 0, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should not save if price is empty' do
      @category = Category.new(name: "Furniture")
      @category.save!
      @product = Product.new(name: "name", price: nil, quantity: 0, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should not save if quantity is empty' do
      @category = Category.new(name: "Furniture")
      @category.save!
      @product = Product.new(name: "name", price: 987.65, quantity: nil, category: @category)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should not save if quantity is empty' do
      @category = Category.new(name: "Furniture")
      @category.save!
      @product = Product.new(name: "name", price: 987.65, quantity: 5, category: nil)
      expect { @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end