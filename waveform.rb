class Waveform
	attr_reader :state,:time
	def initialize(time,state)
		@time = time
		@state = state
	end

	def timenthone(n)
		counter = 0
		for i in 0...@state.length
			counter += 1 if @state[i] == "1"
			return @time[i] if counter == n
		end
		false
	end
end
