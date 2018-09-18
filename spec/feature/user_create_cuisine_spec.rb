require 'rails_helper'

feature 'User create cuisine' do
  scenario 'successfully' do 
  

    visit root_path
    click_on 'Cadastrar cozinhas'
    fill_in 'Nome', with: 'Grega'
    click_on 'Enviar' 

    expect(page).to have_css('h1', text: 'Grega')
    expect(page).to have_content('Cadastrado com sucesso')

  end

  




end