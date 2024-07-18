require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Validations' do
        it 'should validate the presence of password' do
            user = User.new(password: nil, password_confirmation: nil)
            expect(user).not_to be_valid
            expect(user.errors.full_messages).to include("Password can't be blank")
        end
    end
    
    describe '.authenticate_with_credentials' do
        # examples for this class method here
    end
end
