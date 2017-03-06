feature 'Reset all variables' do
  scenario 'I can reset all variables' do
    visit '/set?test=123'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"test"=>"123"}')
    visit '/reset'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('Data Reset!')
    visit '/view'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{}')
  end
end
