require 'spec_helper'

describe Inquiry do
  before do
    @inquiry = FactoryGirl.create(:inquiry)
  end
  
  subject { @inquiry }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:category) }
  it { should respond_to(:content) }
  it { should respond_to(:responses) }
  
  it { should be_valid }

  describe "when name is not present" do
    before { @inquiry.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @inquiry.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @inquiry.email = " " }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com foo@bar..com
                     kameshin@foo.1e @foo.com kameshin@jp]
      addresses.each do |invalid_address|
        @inquiry.email = invalid_address
        expect(@inquiry).not_to be_valid
      end
    end
  end
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @inquiry.email = valid_address
        expect(@inquiry).to be_valid
      end
    end
  end
  
  describe "when category is not present" do
    before { @inquiry.category_id = nil }
    it { should_not be_valid }
  end
  
  describe "when content is not present" do
    before { @inquiry.content = " " }
    it { should_not be_valid }
  end
  
  describe "when content is too long" do
    before { @inquiry.content = "a" * 501 }
    it { should_not be_valid }
  end
  
  describe "response associations" do

    before { @inquiry.save }
    let!(:older_response) do
      FactoryGirl.create(:response, inquiry: @inquiry, created_at: 1.day.ago)
    end
    let!(:newer_response) do
      FactoryGirl.create(:response, inquiry: @inquiry, created_at: 1.hour.ago)
    end

    it "should destroy associated responses" do
      responses = @inquiry.responses.to_a
      @inquiry.destroy
      expect(responses).not_to be_empty
      responses.each do |response|
        expect(Response.where(id: response.id)).to be_empty
      end
    end
  end

  
end
