# require "spec_helper"
require_relative "../lib/person"

module RubyBootcamp
  module Modules
    describe Person do |variable|

      subject(:person) {  Person.new("Dackers") }

      it_behaves_like "a moving entity"

      
    end

  end
end