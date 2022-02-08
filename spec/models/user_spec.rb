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
  end
  describe ".authenticate_with_credentials" do
    it "should return true with valid credentials" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@email.com', 'password')
      expect(user).to_not be(nil)
    end
    it "should not pass with invalid credentials" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@email.com', 'pass')
      expect(user).to be(nil)
    end
    it "should pass with spaces around the email" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('  test@email.com  ', 'password')
      expect(user).to_not be(nil)
    end
    it "should pass with different casing for the email" do
      user = User.new(
        first_name: 'matt',
        last_name: 'woods',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('TEST@EMAIL.COM', 'password')
      expect(user).to_not be(nil)
    end
end
