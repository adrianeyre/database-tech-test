feature 'Get post request' do
  before(:each) do

  end

  scenario 'I can vist the get request page successfully.' do
    visit '/get'
    expect(page.status_code).to eq(200)
  end
end
