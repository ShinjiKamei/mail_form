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
  
  describe "Index page" do
    before do
      FactoryGirl.create(:category)
      FactoryGirl.create(:inquiry)
      visit inquiries_path
    end
    
    it { should have_title('お問合せ一覧') }
    it { should have_content('お問合せ一覧') }
    
    it "should list each inquiry" do
      Inquiry.all.each do |iq|
        expect(page).to have_selector('li', text: iq.name)
      end
    end
    
    describe "pagination" do
      
      before(:all) { 30.times { FactoryGirl.create(:inquiry) } }
      after(:all)  { Inquiry.delete_all }
      
      it { should have_selector('div.pagination') }
      
      it "should list each inquiry" do
        Inquiry.paginate(page: 1).each do |iq|
          expect(page).to have_selector('li', text: iq.name)
        end
      end
    end

    describe "delete links" do
      let(:delete) { "削除" }

      it { should have_link(delete, href: inquiry_path(Inquiry.first)) }
      it "should be able to delete an inquiry" do
        expect do
          click_link(delete, match: :first)
        end.to change(Inquiry, :count).by(-1)
      end
    
    end

  end
  
  
  describe "inquiry page" do
    before do
      FactoryGirl.create(:category)
      @inquiry = FactoryGirl.create(:inquiry)
      @r1 = FactoryGirl.create(:response, inquiry: @inquiry, content: "Foo")
      @r2 = FactoryGirl.create(:response, inquiry: @inquiry, content: "Bar")
      visit inquiry_path(@inquiry)
    end

    it { should have_content(@inquiry.name) }

    describe "responses" do
      it { should have_content(@r1.content) }
      it { should have_content(@r2.content) }
      #it { should have_content(@inquiry.responses.count) }
    end
  end

  
  
end


