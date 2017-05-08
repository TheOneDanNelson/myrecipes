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
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name.capitalize
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name.capitalize
  end
  
  test "should get recipes show" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_match @recipe.name.capitalize, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.chefname, response.body 
    
  end
end
