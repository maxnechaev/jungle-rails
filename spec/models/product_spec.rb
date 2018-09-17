require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
  # validation tests/examples here
  # testing name
    it 'should return true when name is given' do
      @test_product = Product.new(name: 'test')
      expect(@test_product.name).to be_present
    end
    it 'should return nil when name is not given' do
      @test_product = Product.new
      expect(@test_product.name).to be nil
    end

    # testing price
    it 'should return true when price is given' do
      @test_product = Product.new(price: 100)
      expect(@test_product.price).to be_present
    end
    it 'should return nil when price is not given' do
      @test_product = Product.new
      expect(@test_product.price).to be nil
    end

    # testing quantity
    it 'should return true when quantity is > 0' do
      @test_product = Product.new(quantity: 5)
      expect(@test_product.quantity).to be > 0
    end
    it 'should return false when quantity is 0' do
      @test_product = Product.new(quantity: 0)
      expect(@test_product.quantity).to be == 0
    end

    # testing category
    # it 'should return true if the category is given' do
    #   @test_product = Product.new(category: 'testCat')
    #   expect(@test_product.category).to be_present
    # end
    it 'should return nil when category is not given' do
      @test_product = Product.new
      expect(@test_product.category).to be nil
    end



  end

end
