feature 'View all variables' do
  before(:each) do
    visit '/reset'
    visit '/set?variable1=123'
    visit '/set?variable2=456'
  end

  scenario 'I can view all variables' do
    visit '/view'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"variable1"=>"123", "variable2"=>"456"}')
  end
end
