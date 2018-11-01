require 'user'

feature 'Signing up' do
  scenario 'trying to sign up to chitter' do
    setup_test_database
    visit('/login')
    fill_in('Sign up Username', with: 'Max Francis')
    fill_in('Sign up Password', with: '1234')
    fill_in('Sign up email', with: 'Max.Francis@gmail.com')
    click_button('Sign up Submit')

    fill_in('Username', with: 'Max Francis')
    fill_in('Password', with: '1234')
    click_button('Submit')

    expect(page).to have_content "This is the home page"
  end
end
