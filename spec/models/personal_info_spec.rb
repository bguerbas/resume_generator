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
        personal_info = build(:personal_info, full_name: '')

        personal_info.valid?

        expect(personal_info.errors[:full_name].first).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be less than 50 caracteres' do
        personal_info = build(:personal_info, full_name: SecureRandom.hex(60))

        personal_info.valid?
        
        expect(personal_info.errors[:full_name].first).to include('deve ter menos que 50 caracteres')
        expect(personal_info).to be_invalid
      end
    end
    context 'age' do
      scenario 'cannot be blank' do
        personal_info = build(:personal_info, age: '')

        personal_info.valid?

        expect(personal_info.errors[:age].first).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be bigger than 14 years' do
        personal_info = build(:personal_info, age: 10)
      
        personal_info.valid?

        expect(personal_info.errors[:age].first).to include('deve ser maior ou igual a 14')
        expect(personal_info).to be_invalid
      end

      scenario 'must be less than 120 years' do
        personal_info = build(:personal_info, age: 130)

        personal_info.valid?
        
        expect(personal_info.errors[:age].first).to include('deve ser menor ou igual a 120')
        expect(personal_info).to be_invalid
      end

      scenario 'must be integer' do
        personal_info = build(:personal_info, age: 18.50)

        personal_info.valid?
        
        expect(personal_info.errors[:age].first).to include('não é um número inteiro')
        expect(personal_info).to be_invalid
      end
    end

    context 'sex' do
      scenario 'cannot be blank' do
        personal_info = build(:personal_info, sex: '')

        personal_info.valid?

        expect(personal_info.errors[:sex].first).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be valid' do
        personal_info = build(:personal_info, sex: SecureRandom.hex(60))

        personal_info.valid?
        
        expect(personal_info.errors[:sex].first).to include('não é válido')
        expect(personal_info).to be_invalid
      end
    end

    context 'civil status' do
      scenario 'cannot be blank' do
        personal_info = build(:personal_info, civil_status: '')

        personal_info.valid?

        expect(personal_info.errors[:civil_status].first).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end

      scenario 'must be valid' do
        personal_info = build(:personal_info, civil_status: SecureRandom.hex(60))

        personal_info.valid?
        
        expect(personal_info.errors[:civil_status].first).to include('não é válido')
        expect(personal_info).to be_invalid
      end
    end

    context 'nationality' do
      scenario 'cannot be blank' do
        personal_info = build(:personal_info, nationality: '')

        personal_info.valid?

        expect(personal_info.errors[:nationality].first).to include('não pode ficar em branco')
        expect(personal_info).to be_invalid
      end
      scenario 'must be less than 50 caracteres' do
        personal_info = build(:personal_info, nationality: SecureRandom.hex(60))

        personal_info.valid?

        expect(personal_info.errors[:nationality].first).to include('deve ter menos que 50 caracteres')
        expect(personal_info).to be_invalid
      end
    end
  end 
end