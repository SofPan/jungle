require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Users Validations' do
    it 'creates a new user when all fields are filled out' do
      @user = User.new name: "testUser", password: "123abc", password_digest: "123abc", email: "testUser@test.com"
      expect(@user).to be_valid
    end

    it 'saves a new user when the password and password confirmation match' do
      @user = User.new name: "testUser", password: "123abc", password_confirmation: "123abc", email: "testUser@test.com"

      expect(@user.password).to eql(@user.password_confirmation)
    end

    it 'does not save a new user when the password and password confirmation do not match' do
      @user = User.new name: "testUser", password: "123abc", password_confirmation: "abc123", email: "testUser@test.com"

      expect(@user).to_not be_valid
    end

    it 'does not save a new user if their email is not unique' do
      @user1 = User.new name: "testUser", password: "123abc", password_confirmation: "123abc", email: "testUser@test.com"
      @user2 = User.new name: "testUser2", password: "123abc", password_confirmation: "123abc", email: "testUser@test.com"

      expect(@user2).to_not be_valid
    end
  end
end
