require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  def setup
    @chef = Chef.create!(chefname: "Dan", email: "dan@chef.com")
    @recipe = Recipe.create(name: "Veggie Soup", description: "Great soup from the heartland", chef: @chef)
  end 
  
  test "reject invalid recipe update" do
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: { name: " ", description: "something"  } }
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'

  end
  
  test "successfully update a valid recipe" do
    get edit_recipe_path(@recipe)
    assert_template 'recipes/edit'
    updated_name = 'updated recipe name'
    updated_description = 'updated recipe description'
    patch recipe_path(@recipe), params: { recipe: { name: updated_name, description: updated_description } }
    assert_redirected_to @recipe
    assert_not flash.empty?
    @recipe.reload
    assert_match @recipe.name, updated_name
    assert_match @recipe.description, updated_description
  end
    
    
end
