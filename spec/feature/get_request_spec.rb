feature 'Get post request' do
  scenario 'I can vist the get request page successfully.' do
    visit '/get'
    expect(page.status_code).to eq(200)
  end

  scenario 'I can get a variable' do
    visit '/get'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{}')
  end
end
