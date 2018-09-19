require 'rails_helper'

feature 'User login' do
  scenario 'successfully'do
    User.create(email: 'teste@mail.me', password: '123456')

    visit root_path
    click_on 'Entrar'

    within('form') do
      fill_in 'Email', with: 'teste@mail.me'
      fill_in 'Senha', with: '123456'
      click_on 'Entrar'
    end
    expect(current_path).to eq root_path
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    expect(page).to have_content('Olá teste@mail.me')
  end
end