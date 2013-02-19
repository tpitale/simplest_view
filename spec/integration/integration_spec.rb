require 'spec_helper'
require 'support/dummy_app'
require 'support/matchers/have_text'

app = DummyApp.new(ENV["RAILS_ENV"])

app.start_server do
  describe "simplest view in a rails dummy app" do

    it "loads a template from app/templates for the index action" do
      page = app.get "/posts"
      page.should have_text "Posts Template: template/posts/index.html.erb"
    end

    it "loads a template from app/templates for the show action" do
      page = app.get "/posts/1"
      page.should have_text "Posts Template: template/posts/show.html.erb"
    end

    it "uses a view class to add decorator methods" do
      page = app.get "/posts/1"
      page.should have_text "ZAMBIES!!1"
    end

  end
end