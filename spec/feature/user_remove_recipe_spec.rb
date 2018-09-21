require 'rails_helper'

  feature 'remove recipe' do
    scenario 'successfully' do
      author = User.create(email: 'teste@mail.com', password: 'abcd123')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                             cuisine: cuisine, difficulty: 'Médio',
                             cook_time: 60,
                             ingredients: 'Farinha, açucar, cenoura',
                             cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                             user: author)
      # simula a ação do usuário
      visit root_path
      click_on 'Entrar'

      within('form') do
        fill_in 'Email', with: 'teste@mail.com'
        fill_in 'Senha', with: 'abcd123'
        click_on 'Entrar'
      end
      click_on recipe.title
      click_on 'Apagar'
  
      # expectativas do usuário após a ação
      expect(current_path).to eq root_path
      expect(page).not_to have_link('Bolo de cenoura')
    end  

    scenario 'user remove recipe of other user' do
      author = User.create(email: 'teste@mail.com', password: 'abcd123')
      other_user = User.create(email: 'batata@mail.com', password: '123abc')
      recipe_type = RecipeType.create(name: 'Sobremesa')
      cuisine = Cuisine.create(name: 'Brasileira')
      recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: recipe_type,
                             cuisine: cuisine, difficulty: 'Médio',
                             cook_time: 60,
                             ingredients: 'Farinha, açucar, cenoura',
                             cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes',
                             user: author)
      
      visit root_path
      click_on 'Entrar'

      within('form') do
        fill_in 'Email', with: 'batata@mail.com'
        fill_in 'Senha', with: '123abc'
        click_on 'Entrar'
      end
      click_on recipe.title

      expect(page).not_to have_link('Apagar')

              
    end
    
  end  