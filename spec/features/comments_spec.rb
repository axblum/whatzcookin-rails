require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let(:user) { FactoryGirl.create :user}
  let!(:comment) { FactoryGirl.create :comment}

 feature 'any visitor can view a recipe' do
  scenario 'and a user does not have to log in' do
    visit recipe_path
    expect(page).to have_content(:welcome)
  end
end

feature 'user is logged in' do
  scenario 'and can access the login page' do
    visit new_user_session_path
    #fill_in 'Name', :with => user.name
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password

    click_button 'Log in'
  end

  scenario 'and can view a comment' do
    visit recipe_path(recipe.id)
    expect(page).to have_content(:comment)
  end

  scenario 'and can create a comment' do
    visit new_recipe_comment_path
    fill_in :with => :text
    click_on "Save"
      expect(page).to have_content(:comment)
  end
  # scenario 'can edit a comment' do
  #   visit edit_recipe_comment do
  #  click_on 'Save'

    # scenario 'can delete a comment' do
    # visit delete_recipe_comment do
    # click_on 'Delete'

    # scenario 'can comment on a comment' do
    # path will depend on comment ID
    # click_on 'Save'
  end
end
