require 'rails_helper'

RSpec.describe "Users", type: :request do
  before(:each) do
    @user = FactoryBot.create(:user) # Create the user

    # Set up the basic premise of the test by making sure that you have to log in
    visit root_path
    expect(current_path).to eq(new_user_session_path)
    expect(current_path).to_not eq(root_path)

    # Within the form #new_user do the following
    # The reason I put this within a within block is so if there are 2 form fields
    # on the page called Email it will fill in only this one
    within('#new_user') do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    # Since we've logged in we should check if the application redirected us to the right path
    expect(current_path).to eq(root_path)
    expect(current_path).to_not eq(new_user_session_path)
    expect(page).to have_content('Signed in successfully.')
  end

  describe 'GET #index' do
    describe 'valid: ' do
      it 'should return a list of users' do
        click_link 'Users'
        expect(current_path).to eq(users_path)
        save_and_open_page
      end
    end

    describe 'invalid: ' do

    end
  end

  describe 'GET #show' do
    describe 'valid: ' do

    end

    describe 'invalid: ' do

    end
  end

  describe 'POST #create' do
    describe 'valid: ' do

    end

    describe 'invalid: ' do

    end
  end

  describe 'PUT #update' do
    describe 'valid: ' do

    end

    describe 'invalid: ' do

    end
  end

  describe "DELETE #destroy" do
    describe 'valid: ' do

    end
  end
end
