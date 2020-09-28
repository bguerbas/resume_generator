feature 'Visitor access sign up page and' do
  scenario 'find elements of layout' do
    visit new_user_registration_path

    expect(page).to have_content('Revele seu potencial')
    expect(page).to have_content('para as empresas')
    expect(page).to have_content('Pode ser hoje.')
    expect(page).to have_content('É online.')
    expect(page).to have_content('É Revelo.')
    expect(page).to have_content('Olá candidato, seja bem vindo!')
    expect(page).to have_content('Ao continuar, você indica que leu e está de acordo com os termos de uso')
  end
  scenario 'find fields to register' do
    visit new_user_registration_path

    expect(page).to have_content('Digite seu email')
    expect(page).to have_field('user_email')
    expect(page).to have_content('Digite sua senha')
    expect(page).to have_field('user_password')
    expect(page).to have_content('Confirme sua senha')
    expect(page).to have_field('user_password_confirmation')
    expect(page).to have_button('Avançar')
    expect(page).to have_button('Entrar com Linkedin')
    expect(page).to have_button('Continuar com Google')
    expect(page).to have_content('Já tem conta?')
    expect(page).to have_link('Acessar')
  end
end