feature 'Get post request' do

  scenario 'I can vist the get request page successfully.' do
    visit '/get'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{}')
  end

  scenario 'I can a variable' do
    visit '/set?somekey=somevalue'
    visit '/get?key=somekey'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"somekey":"somevalue"}')
  end

  scenario "It displays an empty hash if the variable doesn't exist" do
    visit '/get?random=somekey'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{}')
  end

end
