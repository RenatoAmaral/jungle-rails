require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validation' do

    context "Match passwords" do

      it "should be equal" do
        user = User.new(
          first_name: "Jonh",
          last_name: "Doe",
          email: 'jd@email.com',
          password: "password",
          password_confirmation: "password"
        )
        expect(user[:password]).to eq(user[:password_confirmation])
      end

      it "should not be equal " do
        user = User.new(
          first_name: "Jonh",
          last_name: "Doe",
          email: 'jd@email.com',
          password: "password"
        )
        expect(user).to_not be_valid
      end

      it "should more than 5 characteres " do
        user = User.new(
          first_name: "Jonh",
          last_name: "Doe",
          email: 'jd@email.com',
          password: "1234"
        )
        expect(user).to_not be_valid
      end
    end

    context "Required user info" do

      it "Sould be valid First name, Last name and email" do
        user = User.new(
          first_name: "Jonh",
          last_name: "Doe",
          email: 'jd@email.com',
          password: "password",
          password_confirmation: "password"
        )
        expect(user).to be_valid
      end

      it "Sould not be valid without First name" do
        user = User.new(
          last_name: "Doe",
          email: 'jd@email.com',
          password: "password",
          password_confirmation: "password"
        )
        expect(user).to_not be_valid
      end

      it "Sould not be valid without Last name" do
        user = User.new(
          first_name: "Jonh",
        email: 'jd@email.com',
          password: "password",
          password_confirmation: "password"
        )
        expect(user).to_not be_valid
      end
    end

    context "Email uniqueness" do

      it "Sould not be valid without Last name" do

        user = User.new(
          first_name: "Jonh",
          last_name: "Doe",
          email: 'test@test.COM',
          password: "password",
          password_confirmation: "password"
        )
        user2 = User.new(
          first_name: "Jonh",
          last_name: "Doe",
          email: 'TEST@TEST.com',
          password: "password",
          password_confirmation: "password"
        )

        expect(user.email).to_not eq(user2.email)
      end
    end
  end

  describe '.authenticate_with_credentials' do

    before :each do
      user = User.create!(
        first_name: "Jonh",
        last_name: "Doe",
        email: 'test@test.com',
        password: "password",
        password_confirmation: "password"
      )
    end

    it "should login when email and password are correct" do
      user = User.authenticate_with_credentials("test@test.com", "password")
      expect(user).to be_instance_of(User)
    end

    it "should login when email has extra spaces" do
      user = User.authenticate_with_credentials("      test@test.com", "password")
      expect(user).to be_instance_of(User)
    end

    it "should login when email has wrong case" do
      user = User.authenticate_with_credentials("TEst@TesT.com", "password")
      expect(user).to be_instance_of(User)
    end

  end
end
