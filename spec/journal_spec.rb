require 'spec_helper'

describe Journal do

  before :each do
    @journal = Journal.new({:issn=>"0013-063X", :object_id=>"954921341152"}) 
  end

  describe "#new" do
    it "should be a journal object" do
      @journal.should be_an_instance_of Journal
    end
  end

  describe "#issn" do
    it "should respond to issn" do
      @journal.issn.should_not be_nil
    end
  end

  describe "#object_id" do
   it "should respond to object_id" do
     @journal.object_id.should_not be_nil
   end
  end

  describe "#to_s" do
    it "should produce a string representation of the journal" do
      journal_to_s = "ISSN: 0013-063X: OBJECT ID: 954921341152"
      @journal.to_s.should == journal_to_s
    end
  end
end
