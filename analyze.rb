require "csv"
require_relative "waveform"

waveforms = []

puts ARGV.length

ARGV.each_with_index do |csv_file,index|
	STDERR.puts "Processing #{csv_file}"

	tempname = csv_file.scan(/.*\/([^\..*]+)/).first.last
	temptime = []
	tempstate = []
	CSV.foreach(csv_file,headers: true) do |row|
		#waveforms[index] = Waveform.new(row["timestamp (abs)"],row["Channel-0"])
		temptime << row["timestamp (abs)"]
		tempstate << row["Channel-0"]
	end
	waveforms[index] = Waveform.new(tempname,temptime,tempstate)
end

puts "We have #{waveforms.length} waveforms to analyze"
puts "Waveform 0,1,2, are called:"

for i in 0..2
	puts waveforms[i].name
end
