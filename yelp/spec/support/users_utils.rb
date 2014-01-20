
def sign_up
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_button 'Sign up'
end