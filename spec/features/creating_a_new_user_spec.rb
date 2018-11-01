require 'user'

feature 'Signing up' do
  scenario 'trying to sign up to chitter' do
    setup_test_database
    visit('/login')
    fill_in('Sign up Username', with: 'Max Francis')
    fill_in('Sign up Password', with: '1234')
    fill_in('Sign up email', with: 'Max.Francis@gmail.com')
    click_button('Sign up Submit')

    expect(User.username_list).to include 'Max Francis'
    expect(User.password_list).to include '1234'
    expect(User.email_list).to include 'Max.Francis@gmail.com'

    expect(page).to have_content('This is the login page')

  end
end
