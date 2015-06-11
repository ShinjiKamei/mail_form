require 'spec_helper'

describe "Inquiry pages" do
  
  subject { page }
  
  describe "New page" do
    before { visit root_path }
    
    it { should have_content('お問合せ') }
    it { should have_title('お問合せ') }
  end
  
  
  
end


