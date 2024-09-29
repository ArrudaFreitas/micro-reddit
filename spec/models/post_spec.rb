require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: "John Doe", email: "johndoe@example.com", password: "password123") }

  subject {
    described_class.new(
      head: "Sample Post",
      body: "This is a sample post body that has more than 10 characters.",
      user: user
    )
  }

  context "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a head" do
      subject.head = nil
      expect(subject).not_to be_valid
    end

    it "is not valid with a head longer than 255 characters" do
      subject.head = "a" * 256
      expect(subject).not_to be_valid
    end

    it "is not valid without a body" do
      subject.body = nil
      expect(subject).not_to be_valid
    end

    it "is not valid with a body shorter than 10 characters" do
      subject.body = "Too short"
      expect(subject).not_to be_valid
    end
  end
end
