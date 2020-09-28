feature 'User login' do
  context 'successfully' do
    scenario 'your account' do
      create(:user, email: 'teste@email.com', password: '123456')
      visit new_user_session_path

      fill_in 'user_email', with: 'teste@email.com'
      fill_in 'user_password', with: '123456'

      click_on 'Avançar'

      expect(current_path).to have_content(resume_index_path)
      expect(page).to have_content('Login realizado com sucesso!')
    end
  end
  context 'validations' do
    before(:each) { visit new_user_session_path }

    scenario 'email cannot be blank' do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: '123456'

      click_on 'Avançar'

      expect(page).to have_content('Email ou senha inválidos')
      expect(current_path).to have_content(new_user_session_path)
    end

    scenario 'password cannot be blank' do
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: ''

      click_on 'Avançar'

      expect(page).to have_content('Email ou senha inválidos')
      expect(current_path).to have_content(new_user_session_path)
    end

    scenario 'account not found' do
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: '123456'

      click_on 'Avançar'

      expect(page).to have_content('Email ou senha inválidos')
      expect(current_path).to have_content(new_user_session_path)
    end

    scenario 'password invalid' do
      create(:user, email: 'user@gmail.com', password: '123456')
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: 'AAAAAA'

      click_on 'Avançar'

      expect(page).to have_content('Email ou senha inválidos')
      expect(current_path).to have_content(new_user_session_path)
    end
  end
end