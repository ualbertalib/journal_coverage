require "nokogiri"
require "open-uri"

class WebServices


  def call_by_object_id(object_id)
    endpoint="http://ws.library.ualberta.ca/symws3/rest/standard/searchCatalog?clientID=Primo&term1="
    search_url = "#{endpoint}#{object_id}"
    @xml_response = open(search_url).read
  end

  def record
    @xml_response
  end

  def titleID 
    doc = Nokogiri::XML(@xml_response).remove_namespaces!
    doc.at_xpath("//titleID").text
  end

  def date_statement
    endpoint="http://ws.library.ualberta.ca/symws3/rest/standard/lookupTitleInfo?clientID=Primo&marcEntryFilter=ALL&titleID="
    search_url = "#{endpoint}#{titleID}"
    doc = Nokogiri::XML(open(search_url).read).remove_namespaces!
    doc.xpath("//MarcEntryInfo").each do |element|
      element_value = element.xpath("text").text
      if(element_value.include? "University of Alberta Access") then
        return element_value[element_value.index(':')+2..-1]
      end
    end
  end

end
