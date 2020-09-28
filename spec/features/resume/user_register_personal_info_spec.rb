feature 'User register your personal informations' do
  context 'succesfully' do
    let(:user) { create(:user, email: 'user@email.com', password: '123456') }
    before { login_as user, scope: :user }

    scenario 'and create your resume' do
      visit resume_index_path

      click_on 'Gerar novo currículo'

      fill_in 'Nome Completo', with: 'Nome do Usuário'
      fill_in 'Sexo', with: 'Masculino'
      fill_in 'Idade', with: '18'
      fill_in 'Nacionalidade', with: 'Brasileiro'
      fill_in 'Estado Cívil', with: 'Solteiro'
      click_on 'Gerar currículo'

      expect(current_page).to eq(resume_index_path)
      expect(page).to have_content('Seu currículo foi gerado com sucesso!')
      expect(Resume.last.user).to eq(user)
      expect(PersonalInfo.all.length).to eq(1)
      expect(page).to have_content(Resume.last.created_at)
      expect(page).to have_content(Resume.last.updated_at)
    end
  end

  context 'validations' do
    scenario 'must be authenticate' do
      visit resume_index_path

      expect(current_path).to eq(new_user_registration_path)
    end
    context 'full name' do
      scenario 'cannot be blank' do
        visit resume_index_path

        click_on 'Gerar novo currículo'
  
        fill_in 'Nome Completo', with: ''
        fill_in 'Sexo', with: 'Masculino'
        fill_in 'Idade', with: '18'
        fill_in 'Nacionalidade', with: 'Brasileiro'
        fill_in 'Estado Cívil', with: 'Solteiro'
        click_on 'Gerar currículo'

        expect(current_page).to eq(new_personal_info_path)
        expect(page).to have_content('Nome completo não pode ficar em branco')
        expect(Resume.last.user).not_to eq(user)
        expect(PersonalInfo.all.length).to eq(0)
      end
    end
  end
end