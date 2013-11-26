# Rakefile

desc "Fetch summary holdings data."
task :fetch_dates do
  #`curl http://www.library.ualberta.ca/batchjobs/SFX/sfxTesting/batchTest.php > raw_sfx1`
  sh "./sed_dates.sh"
  `ruby clean_summary_holdings.rb raw_sfx1`
end
