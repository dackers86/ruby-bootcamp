#!/usr/bin/env ruby
require_relative "../lib/binary_tree"
require_relative "../lib/node"
module Quiz

  describe Bst do

    subject(:bst) { Bst.new(Node.new("elephant", :leaf)) }

    before do
      subject.node.add("Example1", :branch, :yes)
      subject.node.add("Example2", :leaf, :no)
    end

    it "should initialise with a answer" do
      expect(subject.node.statement).to eq("elephant")
      expect(subject.node.type).to eq(:leaf)
    end

    it "should add a yes branch" do
      expect(subject.node.yes_node.statement).to eq("Example1")
      expect(subject.node.yes_node.type).to eq(:branch)
    end

    it "should add a yes branch" do
      expect(subject.node.no_node.statement).to eq("Example2")
      expect(subject.node.no_node.type).to eq(:leaf)
    end

    it "should get the next node" do
      subject.next(:yes)
      expect(bst.node.statement).to eq("Example1")
      expect(bst.node.type).to eq(:branch)
    end

    it "should get the next node with a parent assgined" do
      subject.next(:yes)
      subject.next(:yes)
      expect(bst.node.parent_node).not_to be_nil
      expect(bst.node.statement).to be_nil
      expect(bst.node.type).to eq(:branch)
    end

    it "should get the nth node" do
      subject.next(:yes)
      subject.get_first_node
      expect(bst.node.statement).to eq("elephant")
    end

    describe "#Updating" do

      before(:each) do
        allow(subject.interactor).to receive(:ask?).and_return(true)
        allow(subject.interactor).to receive(:ask).and_return("ExampleAnswer", "ExampleQuestion")
      end

      it "should update the current branch type" do
        subject.update_binary_tree(bst.node)
        expect(subject.node.type).to eq(:branch)
      end

      it "should update the question node" do  
        subject.update_binary_tree(bst.node)
        expect(subject.node.statement).to eq("ExampleQuestion")
      end

      it "should move the answer as a yes answer" do
        subject.update_binary_tree(bst.node)
        expect(subject.node.yes_node.statement).to eq("ExampleAnswer")
        expect(subject.node.yes_node.type).to eq(:leaf)
      end

      it "should move the guess as a no answer" do
        subject.update_binary_tree(bst.node)
        expect(subject.node.no_node.statement).to eq("elephant")
        expect(subject.node.no_node.type).to eq(:leaf)
      end

      it "should move the answer as a no answer" do
        allow(subject.interactor).to receive(:ask?).and_return(false)
        subject.update_binary_tree(bst.node)
        expect(subject.node.no_node.statement).to eq("ExampleAnswer")
        expect(subject.node.no_node.type).to eq(:leaf)
      end


      it "should move the guess as a yes answer" do
        allow(subject.interactor).to receive(:ask?).and_return(false)
        subject.update_binary_tree(bst.node)
        expect(subject.node.yes_node.statement).to eq("elephant")
        expect(subject.node.yes_node.type).to eq(:leaf)
      end

      it "should display both statements in the distinguish from question" do

        expect(subject.interactor).to receive(:ask)
               .with("What animal were you thinking of?")
               .with("Give me a question to distinguish ExampleAnswer from elephant?")
        subject.update_binary_tree(bst.node)
      end
    end

  end
end
