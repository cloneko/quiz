require 'Question.rb'

class ArrayQuestion < Quiz::Question
	def initialize(inputPrompt = '')
		@@prompt = inputPrompt == '' ? @@prompt : inputPrompt
	end
	def prompt
		@@prompt
	end

	def q
		@@q.push({'Question' => 'First' , 'Answer' => 'First'})
		@@q.push({'Question' => 'Foobar' , 'Answer' => 'hogehoge'})

		@@q
	end
end
