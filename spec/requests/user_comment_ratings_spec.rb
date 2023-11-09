require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/user_comment_ratings", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # UserCommentRating. As you add validations to UserCommentRating, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UserCommentRating.create! valid_attributes
      get user_comment_ratings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_comment_rating = UserCommentRating.create! valid_attributes
      get user_comment_rating_url(user_comment_rating)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_comment_rating_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      user_comment_rating = UserCommentRating.create! valid_attributes
      get edit_user_comment_rating_url(user_comment_rating)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserCommentRating" do
        expect {
          post user_comment_ratings_url, params: { user_comment_rating: valid_attributes }
        }.to change(UserCommentRating, :count).by(1)
      end

      it "redirects to the created user_comment_rating" do
        post user_comment_ratings_url, params: { user_comment_rating: valid_attributes }
        expect(response).to redirect_to(user_comment_rating_url(UserCommentRating.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserCommentRating" do
        expect {
          post user_comment_ratings_url, params: { user_comment_rating: invalid_attributes }
        }.to change(UserCommentRating, :count).by(0)
      end

    
      it "renders a successful response (i.e. to display the 'new' template)" do
        post user_comment_ratings_url, params: { user_comment_rating: invalid_attributes }
        expect(response).to be_successful
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user_comment_rating" do
        user_comment_rating = UserCommentRating.create! valid_attributes
        patch user_comment_rating_url(user_comment_rating), params: { user_comment_rating: new_attributes }
        user_comment_rating.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the user_comment_rating" do
        user_comment_rating = UserCommentRating.create! valid_attributes
        patch user_comment_rating_url(user_comment_rating), params: { user_comment_rating: new_attributes }
        user_comment_rating.reload
        expect(response).to redirect_to(user_comment_rating_url(user_comment_rating))
      end
    end

    context "with invalid parameters" do
    
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user_comment_rating = UserCommentRating.create! valid_attributes
        patch user_comment_rating_url(user_comment_rating), params: { user_comment_rating: invalid_attributes }
        expect(response).to be_successful
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_comment_rating" do
      user_comment_rating = UserCommentRating.create! valid_attributes
      expect {
        delete user_comment_rating_url(user_comment_rating)
      }.to change(UserCommentRating, :count).by(-1)
    end

    it "redirects to the user_comment_ratings list" do
      user_comment_rating = UserCommentRating.create! valid_attributes
      delete user_comment_rating_url(user_comment_rating)
      expect(response).to redirect_to(user_comment_ratings_url)
    end
  end
end
