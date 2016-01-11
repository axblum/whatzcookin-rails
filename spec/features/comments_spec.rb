require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let(:user) { FactoryGirl.create :user}
  let!(:comment) { FactoryGirl.create :comment}
end

feature 'user is logged in' do
  scenario 'can access the login page' do
    visit new_user_session_path
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.encrypted_password
  end
end
