require 'spec_helper'

describe Response do

  let(:inquiry) { FactoryGirl.create(:inquiry) }
  before do
    @response = inquiry.responses.build(content: "回答します。。。。")
  end

  subject { @response }

  it { should respond_to(:content) }
  it { should respond_to(:inquiry_id) }
  it { should respond_to(:inquiry) }
  its(:inquiry) { should eq inquiry }
  
  it { should be_valid }

  describe "when inquiry_id is not present" do
    before { @response.inquiry_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @response.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @response.content = "a" * 501 }
    it { should_not be_valid }
  end



end
