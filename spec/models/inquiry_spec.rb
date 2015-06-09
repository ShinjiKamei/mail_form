require 'spec_helper'

describe Inquiry do
  before do
    @inquiry = FactoryGirl.create(:inquiry)
  end
  
  subject { @inquiry }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:content) }
  
  
end
