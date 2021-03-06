class SummaryHoldings

  attr_reader :data

  def load_data(data_file)
    @data = eval(File.read(data_file))
  end

  def statement(object_id)
    if data[object_id] then
      summaryHoldings = data[object_id][:summary_holdings]
      if summaryHoldings == "-PROBLEM RECORD-"
        return ""
      else
        years = summaryHoldings.scan(/\d{4}/)
        statement = String.new("")
        (statement = summaryHoldings.split("-")[1] if summaryHoldings.split("-")[1] !~ /\d{4}/) unless summaryHoldings.split("-")[1].nil?
        return "#{years[0]}".strip if (years.size==1 and statement.include?("only"))
        return "#{years[0]}- #{statement}".strip if (years.size==1 and !statement.include?("only"))
        return "#{years[0]}-#{years[1]}".strip if years.size==2
        return "#{years[0]}-#{years[1]}, #{years[2]}-".strip if years.size==3
        return "#{years[0]}-#{years[1]}, #{years[2]}-#{years[3]}".strip if years.size==4
        return "#{years.first}-#{years.last}".strip if years.size > 4
      end
    else
      return "Not found in summary holdings file"
    end
  end
end
