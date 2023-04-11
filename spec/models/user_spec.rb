require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'Should create new User if all fields are valid' do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      expect(new_user.save).to be_truthy
    end

    it 'Should not create new User if passwords do not match' do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "24681012"
      expect(new_user.save).to be_falsy
    end

    it 'Should not create new User if passwords field is blank' do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = nil
      new_user.password_confirmation = nil
      expect(new_user).to_not be_valid
      expect(new_user.errors.full_messages).to include("Password can't be blank")
    end

    it 'Should not create new User if email is not unique' do
      new_user1 = User.create(first_name: "Bob", last_name: "Smith", email: "b@s.com", password: "12345678", password_confirmation: "12345678")
      new_user2 = User.create(first_name: "Bill", last_name: "Stephens", email: "B@S.com", password: "24681012", password_confirmation: "24681012")
      
      expect(new_user2).to_not be_valid
      expect(new_user2.errors.full_messages).to include("Email has already been taken")
    end

   it 'Should not create new User if email is missing' do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = nil
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      expect(new_user).to_not be_valid
      expect(new_user.errors.full_messages).to include("Email can't be blank")
    end

    it 'Should not create new User if first name is missing' do
      new_user = User.new
      new_user.first_name = nil
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      expect(new_user).to_not be_valid
      expect(new_user.errors.full_messages).to include("First name can't be blank")
    end

    it 'Should not create new User if last name is missing' do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = nil
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      expect(new_user).to_not be_valid
      expect(new_user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'Should not create new User if password is less than 8 characters' do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "123456"
      new_user.password_confirmation = "123456"
      expect(new_user).to_not be_valid
      expect(new_user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  describe '.authenticate_with_credentials' do

    it "should return user instance if credentials match" do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      new_user.save

      user = User.authenticate_with_credentials('h@p.com', '12345678')
      expect(user).to eq(new_user)
    end

    it "should return nil instance if credentials do not match" do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      new_user.save

      user = User.authenticate_with_credentials('h@p.com', '12345')
      expect(user).to eq(nil)
    end

    it "should return user instance if credentials match but email has spaces infront/after it" do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      new_user.save

      user = User.authenticate_with_credentials(' h@p.com ', '12345678')
      expect(user).to eq(new_user)
    end

    it "should return user instance if credentials match but email has wrong case" do
      new_user = User.new
      new_user.first_name = "Harsh"
      new_user.last_name = "Patel"
      new_user.email = "h@p.com"
      new_user.password = "12345678"
      new_user.password_confirmation = "12345678"
      new_user.save

      user = User.authenticate_with_credentials('H@P.com', '12345678')
      expect(user).to eq(new_user)
    end

  end

  end
end
