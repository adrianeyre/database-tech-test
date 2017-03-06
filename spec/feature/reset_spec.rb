feature 'Reset all variables' do
  scenario 'I can reset all variables' do
    visit '/reset'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('Data Reset!')
  end
end
