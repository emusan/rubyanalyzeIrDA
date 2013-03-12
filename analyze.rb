require "csv"
require_relative "waveform"

waveforms = []

puts ARGV.length

ARGV.each_with_index do |csv_file,index|
	STDERR.puts "Processing #{csv_file}"

	tempname = csv_file.scan(/.*\/([^.{4}$]+)/).first.last
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
puts waveforms[0].name
