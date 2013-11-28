require "nokogiri"
require_relative "journal"
require_relative "summary_holdings"

class Journals < SummaryHoldings

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
        journals+=journal.to_s+"\n"
      end
    end
    journals
  end

  def report
    report_text = "ISSN, OBJECT ID, SIRSI DATE, SFX DATE\n"
    @list.each do |journal|
      report_text += journal.to_s+", ["+statement(journal.object_id)+"]\n"
    end
    report_text
  end

  def match(journal_in_list, journal_in_summary_holdings)
    journal_in_list.date_statement == statement(journal_in_summary_holdings.object_id)
  end
end

