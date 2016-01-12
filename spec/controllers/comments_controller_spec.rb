require 'rails_helper'
# require 'spec_helper'

RSpec.describe CommentsController, type: :controller do

let(:new_comment) { FactoryGirl.build(:comment)}
let!(:comment) { FactoryGirl.create(:comment) }

  # describe "GET #index" do
  #   it "returns http success for an AJAX request" do
  #     {:get => 'index', :format => :xhr}.should be_routable
  #   #  expect(response).to be_ok
  #   end
  # end

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(200)
  #   end
  # end


  # describe "GET #edit" do
  #   it "returns http success for an AJAX request" do
  #     ('request', :xhr? => true).to be_routable
  #     expect(response).to be_ok
  #   end
  # end
  # describe "GET #edit" do
  #   it "returns http success for an AJAX request" do
  #     {:get => 'edit', :format => :xhr}.to be_routable
  #     expect(response).to be_ok
  #   end
  # end

  describe "GET #edit" do
   # render_views
    before(:each) do
      @new_comment = FactoryGirl.create(:comment)
      @comment = Recipe.find(@new_comment.id)
    get :edit, {:xhr? => true }
     expect(response).should be_success
  end
  end

  # describe "GET #edit" do
  #   it "returns success for an ajax request" do
  #     (xhr :get, :edit).to be_routable
  #     expect(response).to be_ok(200)
  #     end
  #   end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #new" do
    it "returns success if ajax request goes through" do
      get :new, {:xhr? => true}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "returns success if ajax request goes through" do
      get :show, {:format => :xhr}
      expect(response).to have_http_status(200)
    end
  end

end
