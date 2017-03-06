feature 'Set post request' do
  
  scenario 'I can vist the set post request page successfully.' do
    visit '/set?somekey=1'
    expect(page.status_code).to eq(200)
  end

  scenario 'I can set a variable' do
    visit '/set?somekey=somevalue'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"somekey"=>"somevalue"}')
  end

  scenario 'I can set a variable value with spaces' do
    visit '/set?another=test 123'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"another"=>"test 123"}')
  end

  scenario 'I can update an existing variable' do
    visit '/set?exisiting=123'
    visit '/set?exisiting=456'
    visit '/get?key=exisiting'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"exisiting":"456"}')
  end
end
