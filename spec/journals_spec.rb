require_relative "spec_helper"

describe Journals do

  before :each do
    @journals = Journals.new
    @journal = Journal.new({:issn=>"0013-063X", :object_id=>"954921341152"}) 
    @another_journal = Journal.new({:issn=>"0013-063Y", :object_id=>"954921341153"})
  end

  describe "#new" do
    it "should return a SpringerJournals object" do
      @journals.should be_an_instance_of Journals
    end
  end

  describe "#list" do
    it "should return an array (of journals)" do
      @journals.list.should be_an_instance_of Array
    end
  end

  describe "#add" do
    it "should add a journal to the list" do
      @journals.add @journal
      @journals.list.should include(@journal)
    end
  end

  describe "#read" do
    it "should read an xml file and populate the list" do
      @journals.read "spec/test_data.xml"
      @journals.list[0].should == @journal
      @journals.list[1].should == @another_journal
    end
  end

  describe "#print" do
    it "should print out the list of journals" do
      @journals.read "spec/test_data.xml"
      full_string = @journal.to_s+", "+@another_journal.to_s
      @journals.print.should eq(full_string)
    end
  end

end
