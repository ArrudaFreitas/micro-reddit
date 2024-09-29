# RAILS_ENV=test bin/rails db:schema:load

require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      name: "John Doe",
      email: "john@example.com",
      password: "password123"
    )
  }

  context "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it "is not valid with a duplicated email" do
      User.create!(name: "Jane Doe", email: "john@example.com", password: "password456") # Use o mesmo e-mail
      expect(subject).not_to be_valid
      expect(subject.errors[:email]).to include("has already been taken") # Verifique a mensagem de erro correta
    end

    it "downcases the email before saving" do
      subject.email = "JohnDoe@EXAMPLE.COM"
      subject.save!
      expect(subject.email).to eq("johndoe@example.com")
    end
  end

  context "UUID generation" do
    it "generates a UUID as id before creation" do
      subject.save!
      expect(subject.id).to be_present
      expect(subject.id).to match(/\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/)
    end
  end
end
