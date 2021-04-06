require 'rails_helper'
RSpec.describe User, type: :model do

  describe 'Validations' do
    it "with valid data" do
      user = User.new(first_name: "Amit", last_name: "Kumar", email: "kumar@gmail.com", password: "Amit@123", password_confirmation: "Amit@123")
      expect(user).to be_valid
      expect(user.errors.full_messages).to be_empty
    end


    it "Not valid if password or pass_confirmation not match " do
      user = User.new(first_name: "Amit", last_name: "Kumar", email: "kumar@gmail.com", password: "Amit@123", password_confirmation: "Preeti@123")
      expect(user).not_to be_valid
      expect(user.errors.full_messages).to include ("Password confirmation not match Password")
      
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end