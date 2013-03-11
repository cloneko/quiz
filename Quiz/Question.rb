module Quiz
	class Question
		param = nil
		question = nil
		@@prompt = 'input:'
		@@q = []
		def initialize(param = nil)

		end 

		def prompt
			@@prompt
		end


		def q
			@@q
		end

	end 
end
