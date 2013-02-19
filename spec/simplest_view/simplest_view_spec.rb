require 'spec_helper'

require 'pry'


class FooController < ActionController::Base
end

module SimplestView

  describe "the base module" do
    subject { FooController.new }

    it 'modifies the view paths on include' do
      subject.class.send(:include, SimplestView)
      subject.view_paths.collect(&:to_s).grep(/templates$/).count.should > 0
    end
  end

end