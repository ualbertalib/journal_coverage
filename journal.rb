require_relative "web_services"

class Journal < WebServices

  attr_reader :issn, :object_id
  attr_writer :sfx_statement

  def initialize(options={})
    @issn = options[:issn]
    @object_id = options[:object_id]
    call_by_object_id(@object_id)
  end

  def ==(journal)
    @issn == journal.issn && @object_id == journal.object_id
  end

  def to_s
    "#{@issn}, #{@object_id}, #{date_statement}"
  end
end
