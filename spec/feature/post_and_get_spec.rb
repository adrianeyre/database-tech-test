feature 'Post and Get variable' do
  before(:each) do
    visit '/set?myvariable=123'
  end

  scenario 'I can retrieve my set variable' do
    visit '/get?key=myvariable'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{"myvariable":"123"}')
  end

  scenario 'a blank varble is displayed if it has not been set' do
    visit '/get?key=blankvariable'
    expect(page.status_code).to eq(200)
    expect(page).to have_content ('{}')
  end
end
