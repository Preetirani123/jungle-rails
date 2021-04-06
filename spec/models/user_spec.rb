require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should create a user with all fields' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar', email: 'ana@gmail.com',password: 'ana@123',password_confirmation: 'ana@123')
      expect(user).to (be_valid)
    end

    it 'should be invalid with not match password' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana@123',password_confirmation: 'ana@12345')
      expect(user).to_not (be_valid)
    end

    it 'Email should be unique' do
      user1 = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana@123',password_confirmation: 'ana@12345')
      user2 = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana@123',password_confirmation: 'ana@12345')
      expect(user2).to_not (be_valid)
    end

    it 'should be invalid without email' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'nil', password: 'ana@123',password_confirmation: 'ana@12345')
      expect(user).to_not (be_valid)
    end

    it 'should be invalid password less than 5 char' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana',password_confirmation: 'ana')
      expect(user).to_not (be_valid)
    end
  end



  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'Authenticate a user' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana@123',password_confirmation: 'ana@123')
      expect(User.authenticate_with_credentials(user.email, user.password)).to eq(user)
    end

    it 'should still be authenticated successfully with extra email space' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana@123',password_confirmation: 'ana@123')
      input_email = '  ana@gmail.com'
      expect(User.authenticate_with_credentials(input_email, user.password)).to eq(user)
    end

    it 'should  authenticated with wrong case for their email ' do
      user = User.create(first_name: 'Ana',last_name: 'Kumar',email: 'ana@gmail.com', password: 'ana@123',password_confirmation: 'ana@123')
      case_email = 'Ana@gmail.com'
      expect(User.authenticate_with_credentials(case_email, user.password)).to eq(user)
    end
  end
end
