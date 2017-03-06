feature 'Set post request' do
  before(:each) do

  end

  scenario 'I can vist the set post request page successfully.' do
    visit '/set?somekey=1'
    expect(page.status_code).to eq(200)
  end
end
