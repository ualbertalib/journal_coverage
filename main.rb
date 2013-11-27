require_relative "journals"

journals = Journals.new
journals.read ARGV[0]
journals.load_data ARGV[1]
puts journals.report


