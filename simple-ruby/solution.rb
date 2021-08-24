require 'csv'

# Read and parse the CSV dataset
# Pitfall: In order to get numeric values you need enable numeric converters or cast it later.
data = CSV.parse(File.read("COVID19_ICU_210822.csv"), headers: true, converters: :numeric)

# Calculate the sum for all ICU patients
total = data.by_col[3].sum

puts "Total amount of ICU patients: #{total}"

# Calculate the share of all ICU patients per canton
puts "Kanton\tPercentage"
data.by_row.each do |row|
  covid_patients = row[3]
  total_patients = row[2]
  percentage = covid_patients > 0 ? covid_patients.to_f/total_patients*100 : 0
  puts "#{row[1]}\t#{percentage}"
end
