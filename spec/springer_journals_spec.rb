require "spec_helper"

describe SpringerJournals do

  before :each do
    @springer_journals = SpringerJournals.new
    @journal = Journal.new({:issn=>"0013-063X", :object_id=>"954921341152"})   
  end

  describe "#new" do
    it "should return a SpringerJournals object" do
      @springer_journals.should be_an_instance_of SpringerJournals 
    end
  end

  describe "#list" do
    it "should return an array (of journals)" do
      @springer_journals.list.should be_an_instance_of Array
    end
  end

  describe "#add" do
    it "should add a journal to the list" do
      @springer_journals.add @journal
      @springer_journals.list.should include(@journal)
    end
  end

  describe "#read" do
    it "should read an xml file and populate the list" do
      @springer_journals.read "spec/test_data.xml"
      @springer_journals.list[0].should == @journal
    end
  end

end
