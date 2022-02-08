require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "user should be valid" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.valid?).to be true
    end
    it "user must have first name" do
      user = User.new(
        first_name: nil,
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      ) 
      expect(user.valid?). to be false
    end
    it "user must have last name" do
      user = User.new(
        first_name: 'matt',
        last_name: nil,
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.valid?).to be false
    end
    it "user must have email" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.valid?).to be false
    end
    it "user should have a password" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(user.valid?).to be false
    end
    it "user must confirm password when creating account" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: nil
      )
      expect(user.valid?).to be false
    end
    it "user password should be longer than 6 characters" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user.password >= 6).to be true
    end
    it "should return error if password less than 6 characters" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(user.password_confirmation >= 6).to be false
    end
    it 
end
