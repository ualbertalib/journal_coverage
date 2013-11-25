require_relative "journal.rb"
require_relative "journals.rb"

journals = Journals.new
journals.read ARGV[0]
puts journals.print
