feature 'User register' do
  context 'successfully' do
    scenario 'find fields' do
      visit new_user_session

      expect(page).to have_content('Olá candidáto, seja bem vindo!')
      expect(page).to have_content('Digite seu login')
      expect(page).to have_field('login')
      expect(page).to have_content('Digite sua senha')
      expect(page).to have_field('passoword')
    end
    scenario 'new account' do
      visit new_user_session
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
    end
  end
end
