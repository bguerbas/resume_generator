feature 'User access list resumes' do
  context 'sucessfully' do
    let(:user) { create(:user, email: 'user@email.com', password: '123456') }
    before { sign_in user }
  
    scenario 'and view your cvs' do
      visit resume_index_path
      resume = create(:resume, user: user)

      expect(page).to have_content('Curriculos Cadastrados')
      expect(page).to have_content('Data')
      expect(page).to have_content(resume.created_at)
      expect(page).to have_content('Ultima Atualização')
      expect(page).to have_content(resume.updated_at)
      expect(page).to have_link('Ver Dados')
      expect(page).to have_link('Atualizar Dados')
      expect(page).to have_link('Excluir')
      expect(page).to have_link('Exportar em PDF')
    end

    scenario 'and view list empty' do
      visit resume_index_path

      expect(page).to have_content('Não há curriculos cadastrados')
    end

    scenario 'and cannot view resumes of other user' do
      create(:resume)
      visit resume_index_path

      expect(page).to have_content('Não há curriculos cadastrados')
    end
  end
  
  context 'unsucessfully' do
    scenario 'because is not authenticate' do
      visit resume_index_path

      expect(current_path).to eq(new_user_registration_path)
    end
  end
end