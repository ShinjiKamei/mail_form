require 'spec_helper'

describe "Inquiry pages" do
  
  subject { page }
  
  describe "New page" do
    
    before do
      @category = FactoryGirl.create(:category)
      #@category.save
    end
    
    before { visit root_path }
    
    let(:submit) { "create" }
    
    it { should have_content('お問合せ') }
    it { should have_title('お問合せ') }
    
    
    describe "with invalid information" do
      it "should not create an inquiry" do
        expect { click_button submit }.not_to change(Inquiry, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "inquiry_name",   with: "Example User"
        fill_in "inquiry_email",  with: "user@example.com"
        select  @category.name,   from: "inquiry_category_id"
        fill_in "inquiry_content",with: "はろー！"
      end
      
      it "should create an inquiry" do
        expect { click_button submit }.to change(Inquiry, :count).by(1)
      end
    end

    
  end
  
  
  
end


