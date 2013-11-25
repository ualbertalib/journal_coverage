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
    doc.xpath("//record").each do |record|
      issn = record.xpath("datafield[@tag='022']/subfield[@code='a']").text
      object_id = record.xpath("datafield[@tag='090']/subfield[@code='a']").text
      add Journal.new({:issn=>issn, :object_id=>object_id})
    end
  end

  def print
    journals = ""
    @list.each do |journal|
      if journal == @list.last then
        journals+=journal.to_s
      else
        journals+=journal.to_s+", "
      end
    end
    journals
  end
end

