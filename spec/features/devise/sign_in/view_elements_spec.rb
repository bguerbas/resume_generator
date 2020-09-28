feature 'Visitor access sign in page and' do
  scenario 'find elements of layout' do
    visit new_user_session_path

    expect(page).to have_content('Revele seu potencial')
    expect(page).to have_content('para as empresas')
    expect(page).to have_content('Pode ser hoje.')
    expect(page).to have_content('É online.')
    expect(page).to have_content('É Revelo.')
    expect(page).to have_content('Olá candidato, seja bem vindo!')
  end
  scenario 'find fields to login' do
    visit new_user_session_path

    expect(page).to have_content('Digite seu email')
    expect(page).to have_field('user_email')
    expect(page).to have_content('Digite sua senha')
    expect(page).to have_field('user_password')
    expect(page).to have_button('Avançar')
    expect(page).to have_button('Entrar com Linkedin')
    expect(page).to have_button('Continuar com Google')
    expect(page).to have_content('É novo por aqui?')
    expect(page).to have_link('Criar nova conta')
  end
end