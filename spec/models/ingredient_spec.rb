require 'spec_helper'

describe Ingredient do

  describe 'saving the model' do
    context 'given a name and a description' do
      it 'should save the ingredient object' do
        i = Ingredient.new(name:'tomato', description:'it is a vegetable')
        i.save.should be(true)
      end
    end

    context 'given no name' do
      it 'should not save the ingredient object' do
        i = Ingredient.new(description:'it is a vegetable')
        i.save.should be(false)
      end
    end

    context 'given empty name' do
      it 'should not save the ingredient object' do
        i = Ingredient.new(name:'', description:'it is a vegetable')
        i.save.should be(false)
      end
    end

  end
end
