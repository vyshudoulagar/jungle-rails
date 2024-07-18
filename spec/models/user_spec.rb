require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
        it 'should validate the presence of password' do
            user = User.new(password: nil, password_confirmation: nil)
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("Password can't be blank")
        end

        it 'should validate that password and password_confirmation match' do
            user = User.new(password: 'password', password_confirmation: 'other_password')
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'should ensure email uniqueness' do
            user1 = User.create(email: "test@example.com", password: "password", password_confirmation: "password", first_name: "First", last_name: "Last")
            user2 = User.new(email: "TEST@EXAMPLE.COM", password: "password", password_confirmation: "password", first_name: "First", last_name: "Last")
            expect(user2).not_to be_valid
            expect(user2.errors.full_messages).to include("Email has already been taken")
        end

        it 'should validate the presence of email' do
            user = User.new(email: nil)
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("Email can't be blank")
        end

        it 'should validate the presence of first_name' do
            user = User.new(first_name: nil)
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("First name can't be blank")
        end

        it 'should validate the presence of last_name' do
            user = User.new(last_name: nil)
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'should validate that the password has a minimum length' do
            user = User.new(password: "short", password_confirmation: "short")
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
    end
    
    describe '.authenticate_with_credentials' do
        before do
            @user = User.create(email: "test@example.com", password: "password", password_confirmation: "password", first_name: "Test", last_name: "User")
        end

        it 'should return the user if authentication is successful' do
            authenticated_user = User.authenticate_with_credentials("test@example.com", "password")
            expect(authenticated_user).to eq(@user)
        end

        it 'should be authenticated even if there are spaces before and after the email' do
            authenticated_user = User.authenticate_with_credentials(' test@example.com ', 'password')
            expect(authenticated_user).to eq(@user)
        end

        it 'should be authenticated even if the email is typed in wrong case' do
            authenticated_user = User.authenticate_with_credentials('TEST@EXAMPLE.COM', 'password')
            expect(authenticated_user).to eq(@user)
        end
    end
end
