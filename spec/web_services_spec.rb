require "spec_helper"

describe WebServices do

  before :each do
    @web_services = WebServices.new
  end

  describe "#call_by_object_id" do
    it "should respond to call_by_object_id" do
      @web_services.should respond_to(:call_by_object_id)
    end

    it "should return an xml record" do
      xml_record = File.open("spec/test_sirsi_record.xml").read
      @web_services.call_by_object_id("954921341152").should eq xml_record
    end
   end

end
