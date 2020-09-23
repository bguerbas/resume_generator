feature 'User register' do
  context 'successfully' do
    scenario 'new account' do
      visit new_user_registration_path

      fill_in 'login', with: 'Login Teste'
      fill_in 'email', with: 'teste@email.com'
      fill_in 'password', with: '123456'
      fill_in 'password_confirmation', with: '123456'

      click_on 'Avançar'

      expect(page).to have_content('Conta criada com sucesso')
      expect(User.last.login).to eq('Login Teste')
      expect(User.last.email).to eq('teste@email.com')
      expect(User.last.password).to eq('123456')
    end
  end
  context 'validations' do
    context 'login' do
      scenario 'cannot be blank' do
      end
      scenario 'must be uniqueness' do
      end
      scenario 'must be less than 10 caracteres' do
      end
    end
    context 'email' do
      scenario 'cannot be blank' do
      end
      scenario 'must be uniqueness' do
      end
      scenario 'must be valid' do
      end
    end
    context 'password' do
      scenario 'cannot be blank' do
      end
      scenario 'must be less than 10 caracteres' do
      end
      scenario 'must be bigger than 6 caracteres' do
      end
      scenario 'password must be equal to confirm password' do
        
      end
    end
  end
end
