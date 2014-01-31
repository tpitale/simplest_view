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

end
