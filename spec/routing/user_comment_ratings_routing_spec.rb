require "rails_helper"

RSpec.describe UserCommentRatingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/user_comment_ratings").to route_to("user_comment_ratings#index")
    end

    it "routes to #new" do
      expect(get: "/user_comment_ratings/new").to route_to("user_comment_ratings#new")
    end

    it "routes to #show" do
      expect(get: "/user_comment_ratings/1").to route_to("user_comment_ratings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/user_comment_ratings/1/edit").to route_to("user_comment_ratings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/user_comment_ratings").to route_to("user_comment_ratings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/user_comment_ratings/1").to route_to("user_comment_ratings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/user_comment_ratings/1").to route_to("user_comment_ratings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/user_comment_ratings/1").to route_to("user_comment_ratings#destroy", id: "1")
    end
  end
end
