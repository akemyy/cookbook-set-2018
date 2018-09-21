require 'rails_helper'

  feature 'visit view ingredients base' do
    scenario 'sucess'do 
    author = User.create(email: 'teste@mail.com', password: 'abcd123')
    recipe_type = RecipeType.create(name: 'Sobremesa')
    cuisine = Cuisine.create(name: 'Brasileira')
    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                           cuisine: cuisine, difficulty: 'Médio',
                           cook_time: 60,
                           ingredients: 'Farinha, açucar, cenoura',
                           cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                           user: author)
    base_ingredients_cenoura = BaseIngredient.create(name:'cenoura')       
    base_ingredients_farinha = BaseIngredient.create(name:'farinha')          
    BaseIngredientRecipe.create( base_ingredient: base_ingredients_cenoura, recipe: recipe)
    BaseIngredientRecipe.create( base_ingredient: base_ingredients_farinha, recipe: recipe)

    visit root_path
    click_on recipe.title

    # expectativas do usuário após a ação
    expect(page).to have_css('h1', text: recipe.title)
    expect(page).to have_css('h3', text: 'Detalhes')
    expect(page).to have_css('p', text: recipe.recipe_type.name)
    expect(page).to have_css('p', text: recipe.cuisine.name)
    expect(page).to have_css('p', text: recipe.difficulty)
    expect(page).to have_css('p', text: "#{recipe.cook_time} minutos")
    expect(page).to have_css('h3', text: 'Ingredientes')
    expect(page).to have_css('p', text: recipe.ingredients)
    expect(page).to have_css('h3', text: 'Como Preparar')
    expect(page).to have_css('p', text: recipe.cook_method)
    expect(page).to have_css('p', text: author.email)
    expect(page).to have_css('p', text: 'cenoura')
    expect(page).to have_css('p', text: 'farinha')

    end
  
  end