feature 'User register' do
  context 'successfully' do
    scenario 'new account' do
      visit new_user_registration_path

      fill_in 'user_email', with: 'teste@email.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'

      click_on 'Avançar'

      expect(current_path).to have_content(resume_index_path)
      expect(page).to have_content('Conta criada com sucesso')
      expect(User.last.email).to eq('teste@email.com')
    end
  end
  context 'validations' do
    before(:each) { visit new_user_registration_path }
    before(:after) {  expect(current_path).to have_content(new_user_registration_path) }

    context 'email' do
      scenario 'cannot be blank' do
        fill_in 'user_email', with: ''
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'

        click_on 'Avançar'

        expect(page).to have_content('Email não pode ficar em branco')
        expect(User.all.length).to eq(0)
      end
      scenario 'must be uniqueness' do
        create(:user, email: 'teste@email.com')
        fill_in 'user_email', with: 'teste@email.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'

        click_on 'Avançar'

        expect(page).to have_content('Email já está em uso')
        expect(User.all.length).to eq(1)
      end
      scenario 'must be valid' do
        fill_in 'user_email', with: 'teste_email.com'
        fill_in 'user_password', with: '123456'
        fill_in 'user_password_confirmation', with: '123456'

        click_on 'Avançar'

        expect(page).to have_content('Email não é válido')
        expect(User.all.length).to eq(0)
      end
    end
    context 'password' do
      scenario 'cannot be blank' do
        fill_in 'user_email', with: 'teste@gmail.com'
        fill_in 'user_password', with: ''
        fill_in 'user_password_confirmation', with: ''

        click_on 'Avançar'

        expect(page).to have_content('Senha não pode ficar em branco')
        expect(User.all.length).to eq(0)
      end
      scenario 'must be less than 10 caracteres' do
        fill_in 'user_email', with: 'teste@email.com'
        fill_in 'user_password', with: '12345678910'
        fill_in 'user_password_confirmation', with: '12345678910'

        click_on 'Avançar'

        expect(page).to have_content('Senha deve ter menos que 10 caracteres')
        expect(User.all.length).to eq(0)
      end
      scenario 'must be bigger than 6 caracteres' do
        fill_in 'user_email', with: 'teste@email.com'
        fill_in 'user_password', with: '123'
        fill_in 'user_password_confirmation', with: '123'

        click_on 'Avançar'

        expect(page).to have_content('Senha deve ter mais que 6 caracteres')
        expect(User.all.length).to eq(0)
      end
      scenario 'password must be equal to confirm password' do
        fill_in 'user_email', with: 'teste@email.com'
        fill_in 'user_password', with: '123'
        fill_in 'user_password_confirmation', with: '1234'

        click_on 'Avançar'

        expect(page).to have_content('Confirmação da senha não é igual a Senha')
        expect(User.all.length).to eq(0)
      end
    end
  end
end