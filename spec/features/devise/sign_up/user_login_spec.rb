feature 'User login' do
  context 'successfully' do
    scenario 'yout account' do
      create(:user, email: 'teste@email.com', password: '123456')
      visit new_user_session_path

      fill_in 'user_email', with: 'teste@email.com'
      fill_in 'user_password', with: '123456'
      click_on 'Avançar'

      expect(page).to have_current_path(root_path)
      expect(page).to have_content('Login realizado com sucesso!')
      expect(page).to have_content('Sair')
    end
  end
  xcontext 'validations' do
    before(:each) { visit new_user_session_path }

    scenario 'password invalid' do
      create(:user, email: 'teste@email.com', password: '123456')

      fill_in 'user_email', with: 'teste@email.com'
      fill_in 'user_password', with: '111111'
      click_on 'Avançar'

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('Senha inválida')
    end

    scenario 'account not exist' do
      fill_in 'user_email', with: 'teste@email.com'
      fill_in 'user_password', with: '123456'
      click_on 'Avançar'

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('Esta conta não existe')
    end

    scenario 'fields cannot be blank' do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      click_on 'Avançar'

      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content('Os campos não podem estar em branco')
    end
  end
end
