require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let!(:comment) { Comment.create(text: "This is a comment") }
  let!(:recipe) { Recipe.create(api_id: "79878") }

include LoginHelpers

 feature 'any visitor can view a recipe' do
  scenario 'and a user does not have to log in' do
    visit welcome_index_path
    expect(page).to have_content(:welcome)
  end
end

#In another spec, do Gmail login and new user sign ups
feature 'user is logged in' do
  scenario 'and can access the login page' do
    user_login
    expect(page).to have_http_status(200)
  end

  scenario 'and can view a comment' do
    user_login
    visit recipe_path(recipe, comment)
    expect(page).to have_content("WhatzCookin")
  end

     scenario 'and can create a comment' do
      user_login
      visit recipe_path(recipe, comment)
      fill_in 'comment[text]', :with => "Boom, hi"
      click_on 'Save'
      page.driver.browser.navigate.refresh
      expect(page).to have_content("Boom, hi")
  end

  # Needs more interactivity, click on, then save
  #   scenario 'and can create a comment' do
  #     visit new_recipe_comment_path(recipe, comment)
  #     click_on 'comment[text]'
  #     fill_in 'Your comment'
  #     click_on 'Save'
  #     expect(page).to have_content("#new_comment")
  # end

    # scenario 'and can edit a comment' do
    #   recipe.comments << comment
    #   # p recipe.comments2
    #   visit recipe_path(recipe, comment)
    #  # click_on 'new_comment'
    #   fill_in comment[:text], :with => "This is a comment"
    #   click_on 'Save'
    #   expect(page).to have_content("Boom")
    # end

      scenario 'and can edit a comment' do
        recipe.comments << comment
        # p recipe.comments
        visit recipe_path(recipe, comment)
        click_on 'Edit'
        page.find_by_id('comment_text')
        expect(page).to have_content("This is a comment")
      end

  end
end

#Note to self: possible name errors in future re: spec helper folder
