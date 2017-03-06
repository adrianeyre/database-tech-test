feature 'Set post request' do
  before(:each) do
    visit '/reset'
  end
  
  scenario 'I can vist the set post request page successfully.' do
    visit '/set?somekey=1'
    expect(page.status_code).to eq(200)
  end

  scenario 'I can set a variable' do
    visit '/set?somekey=somevalue'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"somekey"=>"somevalue"}')
  end
end
