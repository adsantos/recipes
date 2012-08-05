require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the RecipesHelper. For example:
#
# describe RecipesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe RecipesHelper do

  describe ".ingredient_description_text" do

    let(:ingredient_with_desc) {
      Ingredient.create(name:'potato', description:'vegetable')
    }

    let(:ingredient_without_desc) {
      Ingredient.create(name:'onion')
    }

    context "given an ingredient with a description" do
      it "should return the description" do
        helper.ingredient_description_text(ingredient_with_desc).should
          eq('vegetable')
      end
    end

    context "given an ingredient without a description" do
      it "should return the string not available" do
        helper.ingredient_description_text(ingredient_with_desc).should
          eq('No description')
      end
    end
  end

end
