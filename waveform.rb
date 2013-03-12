class Waveform
	attr_reader :name
	def initialize(name,time,state)
		@name = name
		@time = time
		@state = state
	end

	def timenthone(n)
		counter = 0
		for i in 0...@state.length
			counter += 1 if @state[i] == "1"
			return @time[i].to_i if counter == n
		end
		false
	end

	def deltamn(m,n)
		timenthone(n) - timenthone(m)
	end
end
