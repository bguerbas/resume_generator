RSpec.describe User, type: :model do
  it 'created with successfully' do
    user = create(:user, email: 'teste@gmail.com', password: '1111111')

    expect(user).to be_valid
  end

  context 'validations to' do
    context 'e-mail' do
      it 'cannot be blank' do
        user = build(:user, email: '')

        expect(user).to be_invalid
        expect(user.errors[:email]).to include('não pode ficar em branco')
      end

      it 'must be uniqueness' do
        create(:user, email: 'teste@gmail.com')
        user = build(:user, email: 'teste@gmail.com')

        expect(user).to be_invalid
        expect(user.errors[:email]).to include('já está em uso')
      end

      it 'must be valid' do
        user = build(:user, email: SecureRandom.hex(6))

        expect(user).to be_invalid
        expect(user.errors[:email]).to include('não é válido')
      end

      it 'must be downcase' do
        user = create(:user, email: 'TESTE@gmail.com')

        expect(user).to be_valid
        expect(user.email).to eq('teste@gmail.com')
      end
    end
    context 'password' do
      it 'cannot be blank' do
        user = build(:user, password: '')

        expect(user).to be_invalid
        expect(user.errors[:password]).to include('não pode ficar em branco')
      end

      it 'must be less than 10 caracteres' do
        user = build(:user, password: SecureRandom.hex(6))

        expect(user).to be_invalid
        expect(user.errors[:password]).to include('deve ter menos que 10 caracteres')
      end

      it 'must be bigger than 6 caracteres' do
        user = build(:user, password: SecureRandom.hex(1))

        expect(user).to be_invalid
        expect(user.errors[:password]).to include('deve ter mais que 6 caracteres')
      end
    end
  end
end
