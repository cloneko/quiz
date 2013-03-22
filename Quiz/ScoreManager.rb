module Quiz
	class ScoreManager
		@@score	= 0
		@@questions	= 0
		@@username = ''

		@@result = []
		def initialize(name = '',result = nil,time = nil)
			@@result = result
			@@username = name
      @@time = time
			total 
		end 


		def total
			tmp = 0
			@@result.each {|ary|
				ary.each{|key,value|
					tmp += value ? 1 : 0
					@@questions += 1
				}
			}
			@@score = tmp
		end


		def score
			@@score
		end

		def questions
			@@questions
		end

		def result
			@@result
		end

		def username
			@@username
		end

	end 
end
