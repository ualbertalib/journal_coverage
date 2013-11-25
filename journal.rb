class Journal

  attr_reader :issn, :object_id

  def initialize(options={})
    @issn = options[:issn]
    @object_id = options[:object_id]
  end

  def ==(journal)
    @issn == journal.issn && @object_id == journal.object_id
  end

end