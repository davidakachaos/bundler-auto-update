require 'spec_helper'

describe CLI do
  describe "#test_command" do
    context "when -c option is passed" do
      it "should extract the test command from arguments" do
        CLI.new(%w(-c rake test)).test_command.first.should == 'rake test'
      end
    end

    context "when no -c option" do
      it "should return false" do
        CLI.new(%w(--help meh)).test_command.first.should be_nil
        CLI.new([]).test_command.first.should be_nil
      end
    end
  end
  describe "#--only-patch" do
    context "when --only-patch option is passed" do
      it "should extract the test command from arguments" do
        CLI.new(%w(--only-patch)).test_command[1].should == true
      end
    end

    context "when no --only-patch option" do
      it "should return false" do
        CLI.new(%w(--help meh)).test_command[1].should == false
        CLI.new([]).test_command[1].should == false
      end
    end
  end
  describe "#--only-minor" do
    context "when --only-minor option is passed" do
      it "should extract the test command from arguments" do
        CLI.new(%w(--only-minor)).test_command[1].should == false
        CLI.new(%w(--only-minor)).test_command[2].should == true
      end
    end

    context "when no --only-minor option" do
      it "should return false" do
        CLI.new(%w(--help meh)).test_command[2].should == false
        CLI.new([]).test_command[2].should == false
      end
    end
  end
end
