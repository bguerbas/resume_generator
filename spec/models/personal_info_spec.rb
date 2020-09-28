RSpec.describe PersonalInfo, type: :model do
  context 'successfully' do
    scenario 'create a personal info' do
      personal_info = create(:personal_info)

      expect(personal_info).to be_valid
    end
  end
  context 'validations' do
    context 'full name' do
      scenario 'cannot be blank' do
        personal_info = create(:personal_info, full_name: '')

        expect(personal_info.errors[:full_name]).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be less than 50 caracteres' do
        personal_info = create(:personal_info, full_name: SecureRandom.hex(60))
        
        expect(personal_info.errors[:full_name]).to include('deve ter menos que 50 caracteres')
        expect(personal_info).to be_invalid
      end
    end
    context 'age' do
      scenario 'cannot be blank' do
        personal_info = create(:personal_info, age: '')

        expect(personal_info.errors[:age]).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be bigger than 14 years' do
        personal_info = create(:personal_info, age: 10)
      
        expect(personal_info.errors[:age]).to include('deve ser maior que 14')
        expect(personal_info).to be_invalid
      end

      scenario 'must be less than 120 years' do
        personal_info = create(:personal_info, age: 130)
        
        expect(personal_info.errors[:age]).to include('deve ser menos que 130')
        expect(personal_info).to be_invalid
      end

      scenario 'must be integer' do
        personal_info = create(:personal_info, age: 18.50)
        
        expect(personal_info.errors[:age]).to include('deve ser inteiro')
        expect(personal_info).to be_invalid
      end
    end

    context 'sex' do
      scenario 'cannot be blank' do
        personal_info = create(:personal_info, sex: '')

        expect(personal_info.errors[:sex]).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be valid' do
        personal_info = create(:personal_info, sex: SecureRandom.hex(60))
        
        expect(personal_info.errors[:sex]).to include('inválido')
        expect(personal_info).to be_invalid
      end
    end

    context 'civil status' do
      scenario 'cannot be blank' do
        personal_info = create(:personal_info, civil_status: '')

        expect(personal_info.errors[:civil_status]).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be valid' do
        personal_info = create(:personal_info, civil_status: SecureRandom.hex(60))
        
        expect(personal_info.errors[:civil_status]).to include('inválido')
        expect(personal_info).to be_invalid
      end
    end

    context 'nationality' do
      scenario 'cannot be blank' do
        personal_info = create(:personal_info, nationality: '')

        expect(personal_info.errors[:nationality]).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end
      scenario 'must be valid' do
        personal_info = create(:personal_info, nationality: SecureRandom.hex(60))
        
        expect(personal_info.errors[:nationality]).to include('inválido')
        expect(personal_info).to be_invalid
      end
    end
  end 
end