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

puts waveforms[0].deltamn(0,1) # 4892
puts waveforms[0].deltamn(1,2) # 1033
puts waveforms[0].deltamn(2,3) # 1033
puts waveforms[0].deltamn(3,4) # 1032
puts waveforms[0].deltamn(4,5) # 1033
puts waveforms[0].deltamn(5,6) # 1033
puts waveforms[0].deltamn(14,15) # 104

puts waveforms[0].numones()
