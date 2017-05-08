require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "Dan", email: "dan@chef.com")
    @recipe = Recipe.create(name: "Veggie Soup", description: "Great soup from the heartland", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Chicken a la King", description: "Juicy chicken dish")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_path
    assert_response :success 
  end
  
  test "should get recipe listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_match @recipe.name, response.body 
    assert_match @recipe2.name, response.body 
  end
end
