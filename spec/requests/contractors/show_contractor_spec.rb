require "spec_helper"

describe "Show Contractor Page" do
  let(:contractor)  { FactoryGirl.create(:contractor) }
  let(:show_page)   { ShowContractorPage.new(contractor) }

  context 'when not logged in' do
    before { show_page.visit_page_as nil }
    
    it { expect(show_page).to have_the_proper_title }
  end
end
