# require "spec_helper"
require_relative "../lib/robot"

module RubyBootcamp
  module Modules
    describe Robot do |variable|

      subject(:robot) {  Robot.new("Dackers") }

      it_behaves_like "a moving entity"

      
    end

  end
end