require 'spec_helper'

describe Recipe do

  let(:subject) {
    Recipe.create(name:'Orange cake')
  }

  let(:orange) {
    Ingredient.create(name:'orange')
  }

  let(:step1) {
    Step.create(description:'Mix the sugar with the butter')
  }

  describe 'saving the model' do
    context 'given a name' do
      it 'should save the recipe object' do
        r = Recipe.new(name:'Orange cake')
        r.save.should be(true)
      end
    end

    context 'given a nil name' do
      it 'should not save the recipe object' do
        r = Recipe.new(name:nil)
        r.save.should be(false)
      end
    end
  end

  describe 'getting ingredients' do
    context 'given a recipe which has ingredients' do
      it 'should return the ingredients' do
        subject.ingredients.should eq([])
        subject.ingredients << orange
        subject.ingredients.should eq([orange])
      end
    end
  end

  describe 'getting steps' do
    context 'given a recipe which has steps' do
      it 'should return the steps' do
        subject.steps.should eq([])
        subject.steps << step1
        subject.steps.should eq([step1])
      end
    end
  end

end
