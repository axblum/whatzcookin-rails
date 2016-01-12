require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let!(:comment) { FactoryGirl.create :comment, user_id: user.id }
  let!(:recipe) { FactoryGirl.create :recipe }

include LoginHelpers

#  feature 'any visitor can view a recipe' do
#   scenario 'and a user does not have to log in' do
#     visit welcome_index_path
#     expect(page).to have_content(:welcome)
#   end
# end

#In another spec, do Gmail login and new user sign ups
feature 'user is logged in' do
  scenario 'and can access the login page' do
    user_login
    expect(page).to have_http_status(302)
  end

  scenario 'and can view a comment' do
    visit recipe_path(comment, recipe)
    expect(page).to have_content("#comment_text")
  end

  scenario 'and can create a comment' do
    visit new_recipe_comment_path(comment, recipe)
    click_on "Save"
      expect("form").to have_content("#new_comment")
  end

  scenario 'can edit a comment' do
    recipe.comments << comment
    p recipe.comments
    visit edit_recipe_comment_path(recipe, comment)
    click_on 'Edit'
    fill_in 'Text', :with => "Boom"
    click_on 'Save'
    expect(page).to have_content("Boom")
  end

    # scenario 'can delete a comment' do
    # visit delete_recipe_comment do
    # click_on 'Delete'

    # scenario 'can comment on a comment' do
    # path will depend on comment ID
    # click_on 'Save'
  end
end


#Note to self: possible name errors in future re: spec helper folder
