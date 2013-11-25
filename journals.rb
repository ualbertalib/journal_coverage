require "nokogiri"

class Journals

  attr_reader :list

  def initialize
    @list = []
  end

  def add(journal)
    @list << journal
  end
  
  def read(file)
    doc = Nokogiri::XML(File.open(file)).remove_namespaces!
    issn = doc.xpath("//datafield[@tag='022']/subfield[@code='a']").text
    object_id = doc.xpath("//datafield[@tag='090']/subfield[@code='a']").text
    add Journal.new({:issn=>issn, :object_id=>object_id})
  end
end

