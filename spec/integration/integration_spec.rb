require 'spec_helper'
require 'support/dummy_app'
require 'support/matchers/have_text'

app = DummyApp.new(ENV["RAILS_ENV"])
spec_types = {
  view: ["/posts", "PostsController"]
}

app.start_server do
  spec_types.each do |type, (path, controller)|
    page = app.get(path)

    describe "in the #{type}" do
      it "loads a template from app/templates" do
        page.should have_text "Posts Template: template/posts/index.html.erb"
      end
    end
  end
end