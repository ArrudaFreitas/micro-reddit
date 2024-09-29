require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: "John Doe", email: "johndoe@example.com", password: "password123") }
  let(:post) { Post.create!(head: "Sample Post", body: "Sample body text longer than 10 characters.", user: user) }

  subject {
    described_class.new(
      body: "This is a sample comment.",
      user: user,
      post: post
    )
  }

  context "validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a body" do
      subject.body = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without a user" do
      subject.user = nil
      expect(subject).not_to be_valid
    end

    it "is not valid without a post" do
      subject.post = nil
      expect(subject).not_to be_valid
    end
  end
end
