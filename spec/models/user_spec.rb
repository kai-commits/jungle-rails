require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password: '123', password_confirmation: '123')
      expect(user).to be_valid
    end
    it 'is invalid without first name' do
      user = User.create(last_name: 'marley', email: 'bmarley@example.com', password: '123', password_confirmation: '123')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'is invalid without last name' do
      user = User.create(first_name: 'bob', email: 'bmarley@example.com', password: '123', password_confirmation: '123')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'is invalid without email' do
      user = User.create(first_name: 'bob', last_name: 'marley', password: '123', password_confirmation: '123')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'is invalid if email is not unique' do
      user1 = User.create(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password: '123', password_confirmation: '123')
      user2 = User.create(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password: '123', password_confirmation: '123')
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    it 'is invalid without password' do
      user = User.create(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password_confirmation: '123')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'is invalid without password confirmation' do
      user = User.create(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password: '123')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'is invalid without matching password and password confirmation' do
      user = User.create(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password: '123', password_confirmation: '1234')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'is invalid if password is below minimum length' do
      user = User.create(first_name: 'bob', last_name: 'marley', email: 'bmarley@example.com', password: '1', password_confirmation: '1')
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end
end
