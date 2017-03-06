feature 'Get post request' do
  before(:each) do
    visit '/reset'
  end

  scenario 'I can vist the get request page successfully.' do
    visit '/set?somekey=somevalue'
    visit '/get?key=somekey'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"somekey":"somevalue"}')
  end

  scenario 'I can get a variable' do
    visit '/get'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{}')
  end
end
