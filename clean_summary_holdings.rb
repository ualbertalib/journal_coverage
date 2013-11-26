outfile = "summary_holdings"
of = File.open(outfile, "w")
document = []
document = File.read(ARGV[0])
records = document.split("<line>")
records.delete_at(0)
records_hash = {}
records.each do |record|
  split_record = record.gsub("\n", "").split("^^")
  object_id = split_record[1]
  summary_holdings = split_record[2].gsub(" -- ", "").strip if split_record[2]
  if split_record[3] then
    puts split_record[3]
    free = "free" if split_record[3].strip == "[IS_FREE]"
  end
  if object_id then
    records_hash[object_id] = {:summary_holdings=>summary_holdings, :free=>free} unless summary_holdings == " -- " #This conditional covers nil dates.
  end
end
of.puts records_hash
of.close
