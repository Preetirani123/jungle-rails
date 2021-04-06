require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a user with all fields' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar', email: 'ana@gmail.com',password: 'ana@123',password_confirmation: 'ana@123')
      expect(user).to (be_valid)
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
