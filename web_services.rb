require "open-uri"

class WebServices

  attr_reader :endpoint, :xml_response

  def initialize
    @endpoint="http://ws.library.ualberta.ca/symws3/rest/standard/searchCatalog?clientID=Primo&term1="
  end

  def call_by_object_id(object_id)
    search_url = "#{@endpoint}#{object_id}"
    puts @endpoint
    @xml_response = open(search_url).read
  end

end
