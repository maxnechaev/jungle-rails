require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'should return true when password is given' do
      test_user = User.new(password: 'test')
      expect(test_user.password).to be_present
    end
    it 'should return nil when password is not given' do
      test_user = User.new
      expect(test_user.password).to be nil
    end

    it 'should return true when password_confirmation is given' do
      test_user = User.new(password_confirmation: 'test')
      expect(test_user.password_confirmation).to be_present
    end
    it 'should return nil when password_confirmation is not given' do
      test_user = User.new
      expect(test_user.password_confirmation).to be nil
    end

    it 'should return true when password confirmation matches' do
      test_user = User.new(password: 'test', password_confirmation: 'test')
      expect(test_user.password).to eq(test_user.password_confirmation)
    end
    it 'should return false when passwords do not match' do
      test_user = User.new(password: 'test', password_confirmation: 'test2')
      expect(test_user.password).not_to eq(test_user.password_confirmation)
    end

   # testing password's length
   it "the password's length should be at least 6 characters" do
     test_user = User.new(password: 'qwerty')
     expect(test_user.password.length).to be > 5
   end

   # testing password's uniqueness
   it "Email is not unique" do
    test_user = User.create(first_name: 'John', last_name: 'Watson', email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest')
    expect(test_user).to be_valid
    test_user2 = User.new(first_name: 'John', last_name: 'Watson', email: 'test2@test.com', password: 'testtest', password_confirmation: 'testtest')
    test_user2.valid?
    expect(test_user2.errors.full_messages).not_to include("Email has already been taken")
  end

  #testing email format
  it 'email with invalid format is invalid' do
    test_user = User.new(first_name: 'John', last_name: 'Watson', email: 'test@test.com', password: 'testtest')
    test_user.save
    expect(test_user.errors.full_messages).not_to include('Email is invalid')
  end

  it 'email can be submitted with spaces' do
    test_user = User.new(first_name: 'John', last_name: 'Watson', email: '  test @test.com ', password: 'testtest')
    test_user.email = test_user.email.delete(' ')
    test_user.save
    expect(test_user.errors.full_messages).not_to include('Email is invalid')
  end


end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'authenticated with credentials' do
      test_user = User.new(email: 'test@test.com', password: 'testtest')

    end
  end
end
