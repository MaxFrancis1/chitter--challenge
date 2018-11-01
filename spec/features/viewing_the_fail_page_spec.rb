feature 'Viewing the fail page' do
  scenario 'visiting fail page' do
    setup_test_database
    visit('/login')
    click_button('Submit')
    expect(page).to have_content "failure"
  end
end
