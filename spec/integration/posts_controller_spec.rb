require 'spec_helper'

describe PostsController do

  let(:controller) {PostsController.new}

  context "in the index action" do

    before(:each) do
      controller.stubs(:action_name).returns("index")
    end

    it 'builds a new Posts::IndexView' do
      expect(controller.view_context_class.ancestors).to include(Posts::IndexView)
    end
  end

  context "in the create action" do
    before(:each) do
      controller.stubs(:action_name).returns("create")
    end

    it 'does not error for a missing view class' do
      expect {controller.view_context_class}.to_not raise_error
    end
  end
end
